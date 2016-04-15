module SitesHelper
  def site_favicon_link(site)
    if site.color
      color = site.color.gsub('#', '')
      "//placeholdit.imgix.net/~text?bg=#{color}&w=32&h=32".html_safe
    else
      '/favicon.ico?v=4'
    end
  end

  def site_preview_image(site)
    if site.images.first
      site.images.first.image_2x
    else
      color = site.color.present? ? site.color.gsub('#', '') : '00ba6b'
      "//placeholdit.imgix.net/~text?bg=#{color}&w=1200&h=630".html_safe
    end
  end
end
