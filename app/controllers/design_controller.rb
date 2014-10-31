class DesignController < ApplicationController

  before_action :set_page
  layout :false, only: [:edit] # shown in modal popup

  def edit
    render 'settings/design'
  end

  def update
    if @page.update(page_params)
      head :ok, location: request.referrer
    else
      render json: { page: @page.errors }, status: :unprocessable_entity
    end
  end

  private

    def set_page
      @page = Page.find_by!(:subdomain => request.subdomain)
    end

    def page_params
      params.require(:page).permit(:font, :background_color, :custom_css)
    end
    
end
