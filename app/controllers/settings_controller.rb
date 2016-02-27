class SettingsController < ApplicationController

  before_action :set_site, only: [:show, :edit, :update, :destroy]
  layout :false, only: [:edit] # shown in modal popup

  def update
    if @site.update(site_params)
      head :ok, location: request.referrer
    else
      render json: { site: @site.errors }, status: :unprocessable_entity
    end
  end

  private

  def site_params
    params.require(:site).permit(:name, :description, :color)
  end

end
