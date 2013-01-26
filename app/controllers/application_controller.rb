class ApplicationController < ActionController::Base

  protect_from_forgery

  def set_site
    @site = Site.find_by_subdomain!(request.subdomains.first)
  end
end
