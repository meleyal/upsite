class HelpController < ApplicationController
  before_action :set_site
  before_action :require_site_owner
  layout :false

  class HelpMessageForm < ActiveModel::Form
    self.model_name = 'help_message'
    attribute :message, :string
    validates_presence_of :message
  end

  def new
    @help_message = HelpMessageForm.new
  end

  def create
    @help_message = HelpMessageForm.new(params[:help_message])

    if @help_message.valid?
      NotificationsMailer.help_email(current_user, @help_message.message).deliver_later
      redirect_to request.referrer
    else
      render :new, status: :unprocessable_entity
    end
  end
end
