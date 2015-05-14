class AttachmentsController < ApplicationController

  before_filter :set_page, :set_block
  respond_to :json

  def create
    attachment = @page.attachments.new({ upload: params[:upload] })
    attachment.save
    respond_with(attachment)
  end

  def update
    attachment = @page.attachments.find(params[:id])
    attachment.update_attributes(params[:attachment])
    respond_with(attachment)
  end

  def destroy
    @block.attachments.destroy(params[:id])
    redirect_to request.referrer
  end

  private

  def set_block
    @block = @page.blocks.find(params[:block_id])
  end

end
