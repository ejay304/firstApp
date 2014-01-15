# ************************************************************************************
# participants_controller.rb  
#
# @author Crescenzio Fabio
# @author Fresco Alain
# @author Therisod Romain
# @author Triki Mohamed
# @author Walpen Laurian
# 
# Ce fichier définit le contrôleur pour l'entité participant
#     
# ************************************************************************************
class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate


  # GET /participants
  def index
    @participants = participant_type.all
  end

  # GET /participants/1
  def show
  end

  # GET /participants/new
  def new
    @participant = participant_type.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fact }
    end
  end

  # GET /participants/1/edit
  def edit
  end

  # POST /participants
  def create

    logger.debug @participant
    @participant = participant_type.new(participant_params)

    if @participant.save
      redirect_to @participant, notice: 'Participant was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /participants/1
  def update

    logger.debug "updateing this shit ==> #{participant_params} "
    if @participant.update(participant_params)
      redirect_to @participant, notice: 'Participant was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /participants/1
  def destroy
    @participant.destroy
    redirect_to participants_url, notice: 'Participant was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant
      @participant = Participant.find(params[:id])
    end
    def participant_type
      params[:type].constantize
    end

    # Only allow a trusted parameter "white list" through.
    def participant_params
      params.require(:participant).permit(:name, :firstname, :birthday, :phone, :sexe, :type, :noDossard, :no_license, :dateQualification)
    end
end
