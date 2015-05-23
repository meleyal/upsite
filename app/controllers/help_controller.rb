class HelpController < ApplicationController
  # GET /helps/new
  def new
    # @help = Help.new
  end

  # POST /helps
  def create
    @help = Help.new(help_params)

    respond_to do |format|
      if @help.save
        format.html { redirect_to @help, notice: 'Help was successfully created.' }
        format.json { render :show, status: :created, location: @help }
      else
        format.html { render :new }
        format.json { render json: @help.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def help_params
      params[:help]
    end
end
