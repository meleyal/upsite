class NotificationsMailer < ApplicationMailer
  def help_email(user, message)
    @user = user
    @message = message
    mail(to: 'help@upsite.io', reply_to: @user.email, subject: 'Your help request')
  end

  def analytics_email(type, user, site_url)
    type = type.to_s.humanize
    @message = "#{type}: #{site_url} (#{user.email})"
    mail(to: 'notifications@upsite.io', subject: "Analytics: #{type}")
  end
end
