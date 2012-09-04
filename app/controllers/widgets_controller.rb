class WidgetsController < ApplicationController

  before_filter :set_site
  respond_to :json

  def index
    respond_with @site.widgets.all
  end

  def edit
    respond_with @site.send(widget_type).find(params[:id])
  end

  def create
    respond_with @site.send(widget_type).create(params[:widget])
  end

  def update
    # ap params[:position_position]
    
    respond_with @site.send(widget_type).update(params[:id], params[:widget])
  end

  def destroy
    respond_with @site.send(widget_type).destroy(params[:id])
  end
  
  protected
  
  def set_site
    @site = Site.find_by_subdomain!(request.subdomains.first)
  end
  
  def widget_type
    params[:type] ? params[:type].underscore.pluralize.to_s : 'texts'
  end
  
end