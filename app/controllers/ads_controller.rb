class AdsController < ApplicationController
  skip_before_action :authenticate
  def show
    begin
      ad = current_ads.select{|a| a['id'] == params[:id] }.first
      # redirect_to "#{ad['url']}?#{ad['params'].to_query}"
      redirect_to ad['url']
    rescue
      head :not_found
    end
  end
end
