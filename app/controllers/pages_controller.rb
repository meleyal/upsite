class PagesController < ApplicationController

  include Login
  layout 'signups', only: [:new]
  before_action :set_page, only: [:show, :edit, :destroy]

  def index
    @pages = Page.all
  end

  def show
    @blocks = @page.blocks.all
  end

  def new
    @user = User.new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    @user = User.new(user_params)
    @page.owner = @user
    @page.users << @user

    if @page.save
      login @user
      redirect_to root_url(subdomain: @page.subdomain), notice: 'Page was successfully created.'
    else
      render :new
    end
  end

  def update
    @page.update_attributes(page_params)
    if @page.save
      head :ok, location: request.referrer
    else
      render json: { page: @page.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to pages_url
  end

  private

    def page_params
      params.require(:page).permit(:name, :subdomain, :font, :primary_color, :secondary_color, :custom_css)
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
