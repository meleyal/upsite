class NotificationsMailer < ApplicationMailer
  def signup_email(user, url)
    @user = user
    @url = url
    mail(to: 'notifications@upsite.io', reply_to: @user.email, subject: 'Welcome to Upsite')
  end

  def help_email(user, message)
    @user = user
    @message = message
    mail(to: 'help@upsite.io', reply_to: @user.email, subject: 'Your help request')
  end
end
