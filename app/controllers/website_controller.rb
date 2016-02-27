class WebsiteController < ApplicationController
  def index
    @sites = Site.all
  end
end
