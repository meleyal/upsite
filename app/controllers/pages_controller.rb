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
    @page = Page.new(page_params)
    if @page.save
      redirect_to @page, notice: 'page was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @page.update_attributes(page_params)
    respond_with(@page)
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to pages_url
  end

  private

    def page_params
      # params.require(:widget).permit(:type, :sort_order, :sort_order_position, :data, :page_id)
      params.permit(settings: [:background_color])
    end

end
