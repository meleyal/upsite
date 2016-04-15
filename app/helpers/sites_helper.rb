module SitesHelper
  def site_favicon_link(site)
    if site.color
      color = site.color.gsub('#', '')
      "http://placeholdit.imgix.net/~text?bg=#{color}&w=32&h=32".html_safe
    else
      '/favicon.ico?v=4'
    end
  end

  def site_preview_image_link(site)
    # site.images.first.try(:image_2x)
    color = site.color.present? ? site.color.gsub('#', '') : 'eeeeee'
    "http://placeholdit.imgix.net/~text?bg=#{color}&w=600&h=600".html_safe
  end
end
