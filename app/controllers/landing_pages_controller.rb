class LandingPagesController < ApplicationController
  skip_before_action :authenticate

  def business
    @site = Site.new
    @user = User.new
    @site.owner = @user
  end
end
