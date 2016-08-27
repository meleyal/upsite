class LandingPagesController < ApplicationController
  skip_before_action :authenticate
  before_action :set_site
  layout 'website'
  ADS = %w(simple one)

  def index
    @ad = params[:ad]
    # @version = params[:version] || 'a'
    render(status: 404) unless ADS.include?(@ad)
    # render "index_#{version}"
    render 'index_a'
  end

  private

  def set_site
    @site = Site.new
    @user = User.new
    @site.owner = @user
  end
end
