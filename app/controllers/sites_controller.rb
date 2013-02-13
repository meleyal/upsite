class SitesController < ApplicationController

  before_filter :set_site
  respond_to :json

  def index
    @sites = Site.all
  end

  def show
    @site = Site.find_by_subdomain!(request.subdomains.first)
    @widgets = @site.widgets.all
  end

  def new
    @site = Site.new
  end

  def edit
    @site = Site.find(params[:id])
  end

  def create
    @site = Site.new(params[:site])
    if @site.save
      redirect_to @site, notice: 'Site was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @site.update_attributes(params[:site])
    respond_with(@site)
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy
    redirect_to sites_url
  end

end
