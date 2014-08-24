class SessionsController < ApplicationController
  
  include Login

  layout 'signups'

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      login user
      redirect_to root_url(subdomain: user.page.subdomain)
    else
      flash.now[:error] = 'Wrong email or password'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to login_url(subdomain: nil)
  end

end
