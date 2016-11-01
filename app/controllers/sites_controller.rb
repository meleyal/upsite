class SitesController < ApplicationController
  before_action :set_site, except: [:show, :source]
  before_action :require_site_owner, except: [:show, :source]
  skip_before_action :authenticate, only: [:show, :source]
  layout :false, except: [:show, :edit]

  def index
    @sites = current_user.sites.active
  end

  def show
    @site = Site.active.find_by!(subdomain: request.subdomains.first)
    @blocks = @site.blocks.includes(:attachments).all
    session[:current_site_id] = @site.id if current_user
    render @site.markdown? ? 'show_markdown' : 'show'
  end

  def source
    @site = Site.active.find_by!(subdomain: request.subdomains.first)
    redirect_to view_context.site_url(@site) unless @site.markdown?
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
      render json: {}, status: :created, location: view_context.site_url(@new_site)
    else
      render json: { site: @new_site.errors }, status: :unprocessable_entity
    end
  end

  def edit
    redirect_to root_path unless @site.markdown?
  end

  def update
    @site.update_attributes(site_params)
    if @site.save
        redirect_to root_path
    end
  end

  private

  def site_params
    params.require(:site).permit(
      :name,
      :description,
      :body,
      :color
    )
  end
end
