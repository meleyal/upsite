class DesignController < ApplicationController

  before_action :set_site
  layout :false, only: [:edit] # shown in modal popup

  def edit
    render 'settings/design'
  end

  def update
    if @site.update(site_params)
      head :ok, location: request.referrer
    else
      render json: { site: @site.errors }, status: :unprocessable_entity
    end
  end

  private

  def site_params
    params.require(:site).permit(:font, :background_color, :primary_color, :secondary_color, :custom_css)
  end

end
