class AccountController < ApplicationController

  before_action :set_page, only: [:show, :edit, :update, :destroy]
  layout :false, only: [:edit] # shown in modal popup

  def edit
    render 'settings/account'
  end

  def update
    if @page.update(page_params)
      head :ok, location: request.referrer
    else
      render json: { page: @page.errors }, status: :unprocessable_entity
    end
  end

  private

    def set_page
      @page = Page.find_by!(:subdomain => request.subdomain)
    end

    def page_params
      params.require(:page).permit(:name, :subdomain)
    end

end
