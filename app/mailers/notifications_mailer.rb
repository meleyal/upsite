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

  def help_email(user, message)
    @user = user
    @message = message
    mail(to: 'help@upsite.io', reply_to: @user.email, subject: 'Your help request')
  end

  def newsletter_email(site, subject)
    @site = site
    user = @site.owner
    mail(to: user.email, bcc: 'notifications@upsite.io', subject: subject)
  end

  def password_reset_email(user)
    @user = user
    mail(to: user.email, subject: 'Password reset')
  end
end
