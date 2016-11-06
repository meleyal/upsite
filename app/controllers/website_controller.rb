class WebsiteController < ApplicationController
  skip_before_action :authenticate, only: [:index, :legal, :roadmap, :markdown]
  force_ssl if: :ssl_configured?

  def index
    if params[:filter] == 'all'
      @sites = Site.active.order(updated_at: :desc)
    else
      @sites = Site.active
        .joins(:blocks)
        .includes(:attachments)
        .group('sites.id')
        .where(featured: true)
        .limit(100)
    end
  end
end
