class PagesController < ApplicationController

  include Login
  layout 'signups', only: [:new]
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  layout :false, only: [:edit] # shown in modal popup

  def index
    @pages = Page.all
  end

  def show
    # @page = Page.find_by(subdomainrequest.subdomains.first)
    @widgets = @page.widgets.all
  end

  def new
    @user = User.new
    @page = Page.new # (owner: @user)
    # @page = Page.new
    # @page.users.build
  end

  def edit
  end

  def create
    @page = Page.new(page_params)


    # ap @page.owner
    # @user = User.new(email: params[:page][:owner_attributes][:email])
    @user = User.new(user_params)
    @page.owner = @user
    @page.users << @user
    # @page.owner = User.new
    # @user = User.new(user_params)
    # @page = Page.new(page_params)
    # @page.owner = @user
    # @page.owner =

    if @page.save
      login @user
      redirect_to root_url(subdomain: @page.subdomain), notice: 'Page was successfully created.'
    else
      render :new
    end
  end

  def update
    if @page.update(page_params)
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
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find_by!(:subdomain => request.subdomain)
    end

    # def page_params
    #   # params.require(:widget).permit(:type, :sort_order, :sort_order_position, :data, :page_id)
    #   params.permit(settings: [:background_color])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      # params.require(:page).permit(:name, :subdomain, owner_attributes: [:email])
      params.require(:page).permit(:name, :subdomain, :font, :background_color, :custom_css)
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
