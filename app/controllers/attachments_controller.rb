class AttachmentsController < ApplicationController

  before_filter :set_site, :set_block
  respond_to :json

  def create
    attachment = @site.attachments.new({ upload: params[:upload] })
    attachment.save
    respond_with(attachment)
  end

  def update
    attachment = @site.attachments.find(params[:id])
    attachment.update_attributes(params[:attachment])
    respond_with(attachment)
  end

  def destroy
    @block.attachments.destroy(params[:id])
    redirect_to request.referrer
  end

  private

  def set_block
    @block = @site.blocks.find(params[:block_id])
  end

end
