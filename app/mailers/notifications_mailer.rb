class NotificationsMailer < ApplicationMailer
  def invite_email(invite, invite_url)
    @sender = invite.sender
    @invite_url = invite_url
    mail(to: invite.recipient_email, bcc: 'notifications@upsite.io', subject: 'Invite to join Upsite')
  end

  def welcome_email(user, site_url)
    @site_url = site_url
    mail(to: user.email, bcc: 'notifications@upsite.io', subject: 'Welcome to Upsite')
  end

  def upgrade_email(user)
    mail(to: user.email, bcc: 'notifications@upsite.io', subject: 'Thanks for upgrading to Upsite Pro')
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
