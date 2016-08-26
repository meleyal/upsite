class LandingPagesController < ApplicationController
  skip_before_action :authenticate
  before_action :set_site
  layout 'website'
  PAGES = %w(simple)

  def index
    render(status: 404) unless PAGES.include?(params[:slug])
    # version = params[:version] || 'a'
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
