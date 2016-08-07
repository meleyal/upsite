class SignupsController < ApplicationController
  layout 'website'
  skip_before_action :authenticate

  def new
    @site = Site.new
    @user = User.new
    @site.owner = @user
  end

  def create
    @site = Site.new(site_params)
    @user = current_user || User.new(site_params[:owner_attributes])
    @user.plan = Plan.find_by(code: 'free')

    # TODO: move to model callback?
    @site.owner = @user
    @site.users << @user

    if @site.save
      login @user
      flash[:analytics_new_signup] = true
      NotificationsMailer.signup_email(@user, root_url(subdomain: @site.subdomain)).deliver_now
      if request.xhr?
        response.headers['turbolinks'] = 'false'
        render json: {}, status: :created, location: root_url(subdomain: @site.subdomain)
      else
        redirect_to root_url(subdomain: @site.subdomain)
      end
    else
      if request.xhr?
        render json: { site: @site.errors }, status: :unprocessable_entity
      else
        render 'signups/new'
      end
    end
  end

  private

  def site_params
    params.require(:site).permit(:name, :subdomain, owner_attributes: [:email, :password, :terms])
  end
end
