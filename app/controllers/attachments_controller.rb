class AttachmentsController < ApplicationController
  before_action :set_site
  before_action :require_site_owner
  before_action :set_block
  layout :false

  def edit
    @attachment = @block.attachments.find(params[:id])
  end

  def update
    @attachment = @block.attachments.find(params[:id])
    @attachment.update_attributes(attachment_params)
    if @attachment.save
      head :ok, location: request.referrer
    else
      render json: { attachment: @attachment.errors }, status: :unprocessable_entity
    end
  end

  private

  def set_block
    @block = @site.blocks.find(params[:block_id])
  end

  def attachment_params
    params.require(:attachment).permit(
      :upload_original_w,
      :upload_original_h,
      :upload_box_w,
      :upload_aspect,
      :upload_crop_x,
      :upload_crop_y,
      :upload_crop_w,
      :upload_crop_h
    )
  end
end
