class NotificationsMailer < ApplicationMailer
  def help_email(user, message)
    @user = user
    @message = message
    mail(to: 'help@upsite.io', reply_to: @user.email, subject: 'Upsite / Help')
  end
end
