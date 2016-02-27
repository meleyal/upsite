class SignupsController < ApplicationController
  include Login
  layout 'website'

  def new
    @site = Site.new
    @user = User.new
    @site.owner = @user
  end

  def create
    @site = Site.new(site_params)
    @user = User.new(site_params[:owner_attributes])
    @user.plan = Plan.find_by(code: 'free')

    # TODO: move to model callback?
    @site.owner = @user
    @site.users << @user

    if @site.save
      login @user
      redirect_to root_url(subdomain: @site.subdomain)
    else
      render 'signups/new'
    end
  end

  private

    def site_params
      params.require(:site).permit(:name, owner_attributes: [:email, :password, :terms])
    end
end
