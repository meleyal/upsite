class WidgetsController < ApplicationController

  before_filter :set_site
  respond_to :json

  def index
    respond_with @site.widgets.all
  end

  def show
    # respond_with @site.send(widget_type).find(params[:id])
    respond_with @site.widgets.find(params[:id])
  end

  def edit
    respond_with @site.send(widget_type).find(params[:id])
  end

  def create
    logger.debug { "------------------------- #{params[:type]}" }
    respond_with @site.send(widget_type).create(params[:widget])
  end

  def update
    # widget = @site.send(widget_type).find(params[:id])
    widget = @site.widgets.find(params[:id])
    logger.warn { widget }
    widget.update_attributes(params[:widget])
    respond_with(widget)
  end

  def destroy
    # respond_with @site.send(widget_type).destroy(params[:id])
    respond_with @site.widgets.destroy(params[:id])
  end

  protected

  def widget_type
    params[:type] ? params[:type].underscore.pluralize.to_s : 'texts'
  end

end