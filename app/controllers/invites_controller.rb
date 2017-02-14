class InvitesController < ApplicationController
  before_action :set_site, except: [:show]
  before_action :require_site_owner
  layout :false, except: [:show]

  def new
    @invite = current_user.invites.new
  end

  def create
    @invite = current_user.invites.new(invite_params)
    if @invite.save
      invite_url = view_context.signup_via_invite_url(subdomain: 'www', token: @invite.token)
      NotificationsMailer.invite_email(@invite, invite_url).deliver_now
      render json: {}, status: :created, location: request.referrer
    else
      render json: { invite: @invite.errors }, status: :unprocessable_entity
    end
  end

  private

  def invite_params
    params.require(:invite).permit(:recipient_email)
  end
end
