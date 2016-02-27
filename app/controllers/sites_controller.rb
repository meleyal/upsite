class SitesController < ApplicationController
  include Login
  before_action :set_site, only: [:show, :edit, :destroy]
  before_action :allow_iframe, only: [:show]

  def index
    @sites = Site.active
  end

  def show
    @blocks = @site.blocks.all
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
    params.require(:site).permit(:name, :subdomain, owner_attributes: [:email, :password, :password_confirmation])
  end

  def user_params
    params.require(:owner).permit(:email, :password, :password_confirmation)
  end

  def allow_iframe
    response.headers.delete 'X-Frame-Options' if params[:iframe].present?
  end
end
