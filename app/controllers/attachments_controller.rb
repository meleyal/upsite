class AttachmentsController < ApplicationController

  before_filter :set_page
  respond_to :json

  def index
    @attachments = @page.attachments.all
  end

  def show
    @attachment = @page.attachments.find(params[:id])
  end

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
    respond_with @page.attachments.destroy(params[:id])
  end

end
