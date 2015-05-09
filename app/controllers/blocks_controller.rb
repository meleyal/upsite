class BlocksController < ApplicationController

  before_action :set_page
  before_action :set_block, only: [:show, :edit, :update, :destroy]
  layout :false, only: [:new, :edit] # shown in modal popup

  def index
    ap 'foo'
    @blocks = @page.blocks.all
  end

  def show
  end

  def new
    @block = @page.send(block_type).new
    @block.attachments.build
  end

  def edit
  end

  # Override the location as it otherwise presumes
  # a named route for the block type (e.g. text_url)
  def create
    # ap params
    # p block_type
    @block = @page.send(block_type).new(block_params)
    if @block.save
      head :created, location: request.referrer
    else
      render json: { block: @block.errors }, status: :unprocessable_entity
    end
  end

  def update
    @block.update_attributes(block_params)
    if @block.save
      head :ok, location: request.referrer
    else
      render json: { block: @block.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @page.blocks.destroy(params[:id])
    # head :no_content, location: request.referrer
    redirect_to request.referrer
  end

  protected

    def block_type
      params[:type] ? params[:type].underscore.pluralize.to_s : 'texts'
    end

  private

    def set_block
      @block = @page.blocks.find(params[:id])
    end

    def block_params
      # ap params[:type]
      # type = params[:type].to_sym
      # params.require(:block).permit(:type, :sort_order, :sort_order_position, :data, :page_id)
      # params.permit(:type, :sort_order, :sort_order_position, :page_id, data: [:title, :body])
      # params.require(:text).permit(:type, :sort_order, :sort_order_position, :page_id, data: [:title, :body])
      params.require(:block).permit(
        :type,
        :sort_order,
        :sort_order_position,
        :page_id,
        :title,
        :body,
        :text,
        :layout,
        :background_color,
        attachments_attributes: [:upload])
      # params.permit(:sort_order, :sort_order_position, :page_id, :title, :body)
      # params.require(type).permit(:sort_order, :sort_order_position, :page_id, :title, :body)
    end

end
