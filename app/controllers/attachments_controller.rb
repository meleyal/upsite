class AttachmentsController < ApplicationController

  before_filter :set_site
  respond_to :json

  def index
    @attachments = @site.attachments.all
  end

  def show
    @attachment = @site.attachments.find(params[:id])
  end

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
    respond_with @site.attachments.destroy(params[:id])
  end

end
