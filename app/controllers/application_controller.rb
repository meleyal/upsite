class ApplicationController < ActionController::Base
  include Locale

  helper_method :current_user, :current_page
  protect_from_forgery with: :exception
  before_filter :set_locale

  def set_page
    @page ||= Page.find_by_subdomain!(request.subdomains.first)
  end

  def current_user
    # @current_user ||= session[:user_id] ? User.find(session[:user_id]) : nil
    @current_user ||= User.first
  end

  def current_page
    @current_page ||= current_user ? current_user.page : nil
  end
end
