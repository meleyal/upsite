class ApplicationController < ActionController::Base
  include Locale

  helper_method :current_user, :current_site
  protect_from_forgery with: :exception
  before_filter :set_locale

  def set_site
    @site ||= Site.find_by!(subdomain: request.subdomains.first)
  end

  def current_user
    # @current_user ||= session[:user_id] ? User.find(session[:user_id]) : nil
    @current_user ||= User.first
  end

  def current_site
    @current_site ||= current_user ? current_user.sites : nil
  end
end
