module AdsHelper
  def current_ads
    @current_ads ||= YAML.load_file("#{Rails.root}/config/ads.yml")
  end
end
