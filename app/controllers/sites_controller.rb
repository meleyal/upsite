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
  end

  def new
    @new_site = current_user.sites.new
  end

  def create
    @new_site = Site.new(site_params)
    @new_site.owner = current_user
    @new_site.users << current_user

    if @new_site.save
      response.headers['turbolinks'] = 'false'
      render json: {}, status: :created, location: root_url(subdomain: @new_site.subdomain)
    else
      render json: { site: @new_site.errors }, status: :unprocessable_entity
    end
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

  def upgrade
    NotificationsMailer.analytics_email(:upgrade, current_user, root_url(subdomain: @site.subdomain), :custom_url).deliver_now
    render 'upgrade'
  end

  def upgrade_confirm
    cookies.permanent[:clicked_custom_url_addon_experiment] = true
    NotificationsMailer.analytics_email(:upgrade, current_user, root_url(subdomain: @site.subdomain), params[:source]).deliver_now
    flash[:analytics_upgrade] = true
  end

  private

    def site_params
      params.require(:site).permit(:name, :description, :color, :border)
    end
end
