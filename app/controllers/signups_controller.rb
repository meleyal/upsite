class SignupsController < ApplicationController

  def new
  end

  def create
    @account = Account.new
    @page = @account.page.new(page_params)
    # @signup = Signup.new(params[:signup])

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        # format.json { render json: @signup, status: :created, location: @signup }
      else
        format.html { render action: "new" }
        # format.json { render json: @signup.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def page_params
      params.require(:page).permit(:title)
    end

    def user_params
      params.require(:user).permit(:email, :password)
    end

end
