class BlocksController < ApplicationController

  before_action :set_page
  before_action :set_block, only: [:show, :edit, :update, :destroy]
  layout :false, only: [:new, :edit] # shown in modal popup

  def index
    @blocks = @page.blocks.all
  end

  def show
  end

  def new
    if block_type
      @block = @page.send(block_type).new
      @block.attachments.build
    end
  end

  def edit
  end

  def create
    @block = @page.send(block_type).new(block_params)
    if @block.save
      # Uploading an attachment creates the resource, so return the new resource url
      # to change the form to a PUT request (see dropzone.js)
      render json: { url: block_url(@block) }, status: :created, location: request.referrer
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
      params[:type].present? ? params[:type].underscore.pluralize.to_s : nil
    end

  private

    def set_block
      @block = @page.blocks.find(params[:id])
    end

    def block_params
      params.require(:block).permit(
        :type,
        :sort_order,
        :sort_order_position,
        :title,
        :body,
        :text,
        :layout,
        :background_color,
        attachments_attributes: [:upload])
    end

end
