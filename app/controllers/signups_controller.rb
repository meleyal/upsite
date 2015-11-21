class SignupsController < ApplicationController
  layout 'website'

  def new
  end

  def create
    # @account = Account.new
    # @site = @account.site.new(site_params)
    # # @signup = Signup.new(params[:signup])
    #
    # if @site.save
    #   redirect_to @site
    # else
    #   render action: "new"
    # end
  end

  private

  def site_params
    params.require(:site).permit(:name)
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
