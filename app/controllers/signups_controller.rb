class SignupsController < ApplicationController
  layout :resolve_layout
  skip_before_action :authenticate, only: [:new, :create]
  force_ssl if: :ssl_configured?

  def new
    if current_user
      redirect_to(view_context.site_url(current_user.site)) and return
    end

    @invite = Invite.find_by(token: params[:token])
    @user = User.new(email: @invite && @invite.recipient_email)
    @site = Site.new(owner: @user)
  end

  def create
    @invite = Invite.find_by(token: params[:token])
    @site = Site.new(site_params)
    @user = User.new(site_params[:owner_attributes])
    @user.invite = @invite
    @site.owner = @user

    if site_params[:owner_attributes][:email] != @invite.recipient_email
      @user.errors.add(:email, 'does not match invite token')
      render(json: { site: {}, site_owner: @user.errors }, status: :unprocessable_entity) and return
    end

    # if verify_recaptcha(model: @user, attribute: :recaptcha) && @site.save
    if @site.save
      login @user
      flash[:analytics_signup] = true
      NotificationsMailer.welcome_email(@user, view_context.site_url(@site)).deliver_now
      response.headers['turbolinks'] = 'false'
      render json: {}, status: :created, location: view_context.site_url(@site)
    else
      render json: { site: @site.errors, site_owner: @user.errors }, status: :unprocessable_entity
    end
  end

  def cancel
    @user = current_user
    @site = current_site
  end

  def destroy
    NotificationsMailer.analytics_email(:cancel, current_user, params[:reason]).deliver_now
    cookies.delete(:remember_token, domain: :all)
    current_user.destroy
    redirect_to login_url(subdomain: 'www')
  end

  private

  def site_params
    params.require(:site).permit(
      :name,
      :subdomain,
      owner_attributes: [
        :email,
        :password,
        :terms
      ]
    )
  end

  def resolve_layout
    case action_name
    when 'cancel'
      'application'
    else
      'website'
    end
  end
end
