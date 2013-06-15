class PagesController < ApplicationController

  before_filter :set_page
  respond_to :json

  def index
    @pages = Page.all
  end

  def show
    @page = Page.find_by_subdomain!(request.subdomains.first)
    @widgets = @page.widgets.all
  end

  def new
    @page = Page.new
  end

  def edit
    @page = Page.find(params[:id])
  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      redirect_to @page, notice: 'page was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @page.update_attributes(params[:page])
    respond_with(@page)
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to pages_url
  end

end
