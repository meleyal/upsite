class BlocksController < ApplicationController

  before_action :set_site
  before_action :set_block, only: [:show, :edit, :update, :destroy]
  layout :false, only: [:new, :edit] # shown in modal popup

  def index
    @blocks = @site.blocks.all
  end

  def new
    if block_type
      @block = @site.send(block_type).new
      @block.attachments.build
    end
  end

  def create
    @block = @site.send(block_type).new(block_params)
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
    @site.blocks.destroy(params[:id])
    # head :no_content, location: request.referrer
    redirect_to request.referrer
  end

  protected

    def block_type
      params[:type].present? ? params[:type].underscore.pluralize.to_s : nil
    end

  private

    def set_block
      @block = @site.blocks.find(params[:id])
    end

    def block_params
      params.require(:block).permit(
        :type,
        :sort_order,
        :sort_order_position,
        :body,
        :url,
        :color,
        attachments_attributes: [:upload])
    end

end
