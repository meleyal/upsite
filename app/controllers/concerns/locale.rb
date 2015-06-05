module Locale
  extend ActiveSupport::Concern

  self.included do
    helper_method :current_locale, :available_locales
  end

  private

  def set_locale
    I18n.locale = locale = params[:locale] || cookies[:locale] || extract_locale || I18n.default_locale
    cookies.permanent[:locale] = locale unless (cookies[:locale] && cookies[:locale] == locale)
  end

  def extract_locale
    begin
      locale = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/[\w-]+/).first #=> zh-CN, en-US, en
      short_locale = locale.split('-').first #=> en, de
      match = available_locales.keys.select { |k| k.to_s == locale || k.to_s == short_locale }
      match.length ? match.first : false
    rescue
      false
    end
  end

  def current_locale
    I18n.locale
  end

  def available_locales
    { en: "English",
      es: "Español" }
  end
end
