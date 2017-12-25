class SubscriptionsController < ApplicationController
  force_ssl if: :ssl_configured?
  protect_from_forgery :except => :webhook
  skip_before_action :authenticate, only: [:webhook]

  def new
    redirect_to site_url(current_site) if current_user.pro? && !current_user.promo?
    @site = current_site
    @user = @site.owner
    @subscription = Subscription.new
    NotificationsMailer.analytics_email(:viewed_upgrade, current_user).deliver_now
  end

  def create
    # Subscription.transaction do
    #   @site = current_site
    #   customer = Stripe::Customer.retrieve(current_user.stripe_customer_id)
    #   subscription = Stripe::Subscription.retrieve(customer.subscriptions.first.id)
    #   subscription.plan = Plan.pro.code
    #   subscription.source = params[:token]
    #   if params[:promo_code].present?
    #     coupon = Stripe::Coupon.retrieve(params[:promo_code].upcase)
    #     subscription.coupon = coupon.id
    #   end
    #   subscription.prorate = false
    #   subscription.save
    #   current_user.subscription.update(
    #     plan: Plan.pro,
    #     ends_at: Time.at(subscription.current_period_end)
    #   )
    #   NotificationsMailer.upgrade_email(current_user).deliver_now
    #   flash[:analytics_upgrade] = true
    #   redirect_to view_context.site_url(@site), notice: 'Subscribed to Upsite Pro!'
    # end
    #
    # rescue Stripe::CardError, Stripe::InvalidRequestError => e
    #   flash[:error] = e.message
    #   redirect_to upgrade_path
  end

  def destroy
    # Subscription.transaction do
    #   customer = Stripe::Customer.retrieve(current_user.stripe_customer_id)
    #   subscription = Stripe::Subscription.retrieve(customer.subscriptions.first.id)
    #   subscription.plan = Plan.free.code
    #   subscription.prorate = false
    #   subscription.save
    #   current_user.subscription.update(
    #     plan: Plan.free,
    #     ends_at: nil
    #   )
    #   NotificationsMailer.analytics_email(:downgrade, current_user, params[:reason]).deliver_now
    #   redirect_to view_context.site_url(current_site), notice: 'Upsite Pro subscription cancelled'
    # end
  end

  def cancel
    redirect_to site_url(current_site) unless current_user.pro?
    @site = current_site
    @subscription = current_user.subscription
  end

  def webhook
    begin
      event = Stripe::Event.retrieve(params[:id])
      # event = Stripe::Event.construct_from(params)
      data = event.data.object
      user = User.find_by(stripe_customer_id: data.customer)
      url = "https://dashboard.stripe.com/events/#{data.id}"
      case event.type
      when 'invoice.payment_succeeded'
        Subscription.transaction do
          user.subscription.update(ends_at: Time.at(data.lines.data.first.period.end))
          # NotificationsMailer.analytics_email(:webhook_invoice_payment_succeeded, user, url).deliver_now
        end
      when 'invoice.payment_failed'
        Subscription.transaction do
          user.change_plan!(Plan.free)
          NotificationsMailer.analytics_email(:webhook_invoice_payment_failed, user, url).deliver_now
          NotificationsMailer.payment_failed_email(user).deliver_now
        end
      end
      return head :ok
    rescue Exception => e
      return head :ok
    end
  end
end
