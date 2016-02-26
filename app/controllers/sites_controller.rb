class SitesController < ApplicationController

  include Login
  before_action :set_site, only: [:show, :edit, :destroy]

  def index
    @sites = Site.all
  end

  def show
    @blocks = @site.blocks.all
  end

  def new
    @user = User.new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    @user = User.new(user_params)
    @user.plan = Plan.find_by(code: 'free')

    # TODO: move to model callback?
    @site.owner = @user
    @site.users << @user

    if @site.save
      login @user
      redirect_to root_url(subdomain: @site.subdomain)
    else
      render :new
    end
  end

  def update
    @site.update_attributes(site_params)
    if @site.save
      head :ok, location: request.referrer
    else
      render json: { site: @site.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy
    redirect_to sites_url
  end

  private

  def site_params
    params.require(:site).permit(:name, :subdomain, :font, :primary_color, :secondary_color, :custom_css)
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
