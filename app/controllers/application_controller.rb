class ApplicationController < ActionController::Base

  protect_from_forgery

  def set_page
    @page = Page.find_by_subdomain!(request.subdomains.first)
  end
end
