module Login
  extend ActiveSupport::Concern

  private

    def login(user)
      remember_token = User.new_remember_token
      user.update_attribute(:remember_token, User.digest(remember_token))
      cookies.permanent[:remember_token] = { value: remember_token, domain: :all }
      session[:user_id] = user.id
    end

    def logout
      current_user.update_attribute(:remember_token, User.digest(User.new_remember_token))
      cookies.delete(:remember_token, domain: :all)
      reset_session
    end
end
