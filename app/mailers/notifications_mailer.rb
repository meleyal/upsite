class NotificationsMailer < ApplicationMailer
  def help_email(user, message)
    @user = user
    @message = message
    mail(to: 'help@upsite.io', reply_to: @user.email, subject: 'Your help request')
  end

  def payment_failed_email(user)
    mail(to: user.email, subject: 'Payment Failed')
  end

  def analytics_email(type, user, message='')
    @event = type.to_s.humanize
    @user = user
    @message = message
    mail(to: 'notifications@upsite.io', subject: "Analytics: #{@event}")
  end
end
