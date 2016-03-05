class ApplicationController < ActionController::Base
  # include Locale
  # before_action :set_locale
  before_action :authenticate

  # Prevent CSRF attacks by raising an exception.
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

  def current_user
    @current_user ||= session[:user_id] ? User.find(session[:user_id]) : nil
  end

  helper_method :current_user
end
