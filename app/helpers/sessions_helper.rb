module SessionsHelper
  def login(user)
    remember_token = User.new_remember_token
    cookies[:remember_token] = { value: remember_token, expires: 20.years.from_now.utc, domain: :all }
    user.update_attribute(:remember_token, User.digest(remember_token))
    self.current_user = user
  end

  def logout
    current_user.update_attribute(:remember_token, User.digest(User.new_remember_token))
    cookies.delete(:remember_token, domain: :all)
    self.current_user = nil
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = User.digest(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_site
    if session[:current_site_id]
      @current_site ||= current_user.sites.find(session[:current_site_id])
    end
  end
end
