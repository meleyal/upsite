class WebsiteController < ApplicationController
  skip_before_action :authenticate, only: [:index, :terms, :privacy]

  def index
    @sites = Site.active.order(:featured, updated_at: :desc).limit(100)
  end
end
