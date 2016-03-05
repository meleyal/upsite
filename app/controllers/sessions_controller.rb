class SessionsController < ApplicationController
  include Login
  layout 'website'
  before_action :redirect_signed_in_user, only: [:new]
  skip_before_action :authenticate

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      login user
      redirect_to root_url(subdomain: user.sites.first.subdomain)
    else
      flash.now[:error] = 'Wrong email or password'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to login_url(subdomain: 'www')
  end

  private

    def redirect_signed_in_user
      redirect_to root_url(subdomain: current_user.site.subdomain) if current_user
    end
end
