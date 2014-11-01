class WidgetsController < ApplicationController

  before_action :set_page 
  before_action :set_widget, only: [:show, :edit, :update, :destroy]
  layout :false, only: [:new, :edit] # shown in modal popup

  def index
    ap 'foo'
    @widgets = @page.widgets.all
  end

  def show
  end

  def new
    @widget = @page.send(widget_type).new 
    @widget.attachments.build
  end

  def edit
  end

  # Override the location as it otherwise presumes
  # a named route for the widget type (e.g. text_url)
  def create
    # ap params
    # p widget_type
    @widget = @page.send(widget_type).new(widget_params)
    if @widget.save
      head :created, location: request.referrer
    else
      render json: { widget: @widget.errors }, status: :unprocessable_entity
    end
  end

  def update
    @widget.update_attributes(widget_params)
    if @widget.save
      head :ok, location: request.referrer
    else
      render json: { widget: @widget.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @page.widgets.destroy(params[:id])
    # head :no_content, location: request.referrer
    redirect_to request.referrer
  end

  protected

    def widget_type
      params[:type] ? params[:type].underscore.pluralize.to_s : 'texts'
    end

  private

    def set_widget
      @widget = @page.widgets.find(params[:id])
    end

    def widget_params
      # ap params[:type]
      # type = params[:type].to_sym
      # params.require(:widget).permit(:type, :sort_order, :sort_order_position, :data, :page_id)
      # params.permit(:type, :sort_order, :sort_order_position, :page_id, data: [:title, :body])
      # params.require(:text).permit(:type, :sort_order, :sort_order_position, :page_id, data: [:title, :body])
      params.require(:widget).permit(:type, :sort_order, :sort_order_position, :page_id, :title, :body, attachments_attributes: [:upload])
      # params.permit(:sort_order, :sort_order_position, :page_id, :title, :body)
      # params.require(type).permit(:sort_order, :sort_order_position, :page_id, :title, :body)
    end

end
