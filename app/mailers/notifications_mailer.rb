class NotificationsMailer < ApplicationMailer
  def help_email(user, message)
    @user = user
    @message = message
    mail(to: 'help@upsite.io', reply_to: @user.email, subject: 'Your help request')
  end

  def analytics_email(type, user, site_url, source = nil)
    @event = type.to_s.humanize
    @event += " (source: #{source})" if source
    @user_email = user.email
    @site_url = site_url
    mail(to: 'notifications@upsite.io', subject: "Analytics: #{@event}")
  end
end
