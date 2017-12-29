class BlocksController < ApplicationController
  before_action :set_site
  before_action :require_site_owner
  before_action :set_block, only: [:edit, :update, :destroy]
  layout :false

  def new
    if block_type
      @block = @site.send(block_type).new
      @block.attachments.build
    end
  end

  def create
    @block = @site.send(block_type).new(block_params)

    if @block.save
      render json: { url: block_url(@block) }, status: :created, location: request.referrer
    else
      render json: { block: @block.errors }, status: :unprocessable_entity
    end
  end

  def edit
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
    redirect_to request.referrer
  end

  def sort
    params[:block][:ids].each_with_index do |id, index|
      @site.blocks.find(id).update_attribute(:position, index + 1)
    end
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
      :ids,
      :type,
      :position,
      :title,
      :body,
      :embed_url,
      :link_url,
      :color,
      attachments_attributes: [:upload])
  end
end
