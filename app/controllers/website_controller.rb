class WebsiteController < ApplicationController
  skip_before_action :authenticate, only: [:index, :terms, :privacy]

  def index
    @sites = Site.active.order(:featured, created_at: :desc).limit(500)
  end
end
