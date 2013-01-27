class WidgetsController < ApplicationController

  before_filter :set_site
  respond_to :json

  def index
    @widgets = @site.widgets.all
  end

  def show
    @widget = @site.widgets.find(params[:id])
  end

  def create
    respond_with @site.send(widget_type).create(params[:widget])
  end

  def update
    widget = @site.widgets.find(params[:id])
    widget.update_attributes(params[:widget])
    respond_with(widget)
  end

  def destroy
    respond_with @site.widgets.destroy(params[:id])
  end

  protected

  def widget_type
    params[:type] ? params[:type].underscore.pluralize.to_s : 'texts'
  end

end