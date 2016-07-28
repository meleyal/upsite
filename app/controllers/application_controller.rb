class ApplicationController < ActionController::Base
  include SessionsHelper
  include AdsHelper
  
  before_action :authenticate
  protect_from_forgery with: :exception

  private
  def authenticate
    redirect_to login_url(subdomain: 'www') unless current_user
  end

  def require_site_owner
    if current_user != @site.owner
      redirect_to login_url(subdomain: 'www')
    end
  end

  def set_site
    @site ||= current_user.sites.find_by!(subdomain: request.subdomains.first)
  end
end
