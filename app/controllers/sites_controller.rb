class SitesController < ApplicationController
  before_action :set_site, except: [:show]
  before_action :require_site_owner, except: [:show]
  skip_before_action :authenticate, only: [:show]
  layout :false, except: [:show]

  def index
    @sites = current_user.sites.active
  end

  def show
    @site = Site.all.find_by!(subdomain: request.subdomains.first)
    @blocks = @site.blocks.includes(:attachments).all
    # @sponsors = Site.active.pro.order("RANDOM()").limit(5).where.not(id: @site.id)
    @sponsors = Site.active.order("RANDOM()").limit(5).where.not(id: @site.id)
  end

  def edit
  end

  def update
    @site.update_attributes(site_params)
    if @site.save
      head :ok, location: request.referrer
    else
      render json: { site: @site.errors }, status: :unprocessable_entity
    end
  end

  private

    def site_params
      params.require(:site).permit(:name, :description, :color, :border)
    end
end
