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
    image = site.images.order(:position).first
    image.try(:image_2x) || image.try(:embed_url) || ''
  end
end
