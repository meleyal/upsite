class SettingsController < ApplicationController
  before_action :set_site
  before_action :require_site_owner
  layout :false

  def edit
    render "sites/settings/#{params[:group]}"
  end

  def update
    @site.update_attributes(site_params)
    if @site.save
      head :ok, location: request.referrer
    else
      render json: { site: @site.errors }, status: :unprocessable_entity
    end
  end

  private

  def site_params
    params.require(:site).permit(
      :name,
      :description,
      :body,
      :color,
      :markdown
    )
  end
end
