class PasswordResetsController < ApplicationController
  layout 'website'
  skip_before_action :authenticate
  force_ssl if: :ssl_configured?, only: [:new, :edit]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_password_reset_token
      @user.send_password_reset_email
      flash[:success] = "Email sent with password reset instructions"
      redirect_to login_path
    else
      flash.now[:error] = "Email address not found"
      render 'new'
    end
  end

  def edit
    @user = User.find_by!(password_reset_token: params[:id])
  end

  def update
    @user = User.find_by!(password_reset_token: params[:id])
    if @user.password_reset_sent_at < 48.hours.ago
      flash[:error] = "Password reset has expired"
      redirect_to new_password_reset_path
    elsif @user.update_attributes(user_params)
      flash[:success] = "Password has been reset"
      redirect_to login_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
