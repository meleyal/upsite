module SitesHelper
  def site_favicon_link(site)
    if site.color.present?
      color = site.color.gsub('#', '')
      "http://placeholdit.imgix.net/~text?bg=#{color}&w=32&h=32".html_safe
    else
      '/favicon.ico?v=4'
    end
  end

  def site_url(site)
    root_url(subdomain: site.subdomain, protocol: 'http://')
  end

  def site_url_without_protocol(site)
    site_url(site).gsub('http://', '').gsub('/', '')
  end
end
