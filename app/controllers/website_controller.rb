class WebsiteController < ApplicationController
  skip_before_action :authenticate, only: [:index, :legal, :roadmap]
  force_ssl if: :ssl_configured?

  def index
    if params[:filter] == 'all'
      @sites = Site.active.order(updated_at: :desc)
    else
      @sites = Site.active
        .joins(:blocks)
        .includes(:attachments)
        .group('sites.id')
        .having('count(site_id) > 3')
        .where('featured IS NOT false')
        .order(updated_at: :desc)
        .limit(100)
    end
  end
end
