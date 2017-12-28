class ApplicationController < ActionController::Base
  include SessionsHelper
  include SitesHelper

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
    @site ||= Site.find_by!(subdomain: request.subdomains.first)
  end

  def ssl_configured?
    !Rails.env.development?
  end
end
