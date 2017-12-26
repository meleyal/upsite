class WebsiteController < ApplicationController
  skip_before_action :authenticate, only: [:index, :legal]
  force_ssl if: :ssl_configured?

  def index
    @sites = Site
      .joins(:blocks)
      .includes(:attachments)
      .group('sites.id')
      .order(updated_at: :desc)
  end
end
