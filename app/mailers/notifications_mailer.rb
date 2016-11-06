class NotificationsMailer < ApplicationMailer
  def welcome_email(user, site_url)
    @site_url = site_url
    mail(to: user.email, subject: 'Welcome to Upsite 👋')
  end

  def upgrade_email(user)
    mail(to: user.email, subject: 'Thanks for upgrading to Upsite Pro 🎉')
  end

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
