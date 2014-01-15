# ************************************************************************************
# gyms_controller.rb  
#
# @author Crescenzio Fabio
# @author Fresco Alain
# @author Therisod Romain
# @author Triki Mohamed
# @author Walpen Laurian
# 
# Ce fichier définit le contrôleur pour l'entité salle de sport
#     
# ************************************************************************************
class GymsController < ApplicationController
  before_action :set_gym, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate


  # GET /gyms
  def index
    @gyms = Gym.all

    respond_to do |format|
      format.html 
      format.json { render json: @gyms }
    end
  end

  # GET /gyms/1
  def show

    respond_to do |format|
      format.html 
      format.json { render json: @gym }
    end
  end

  # GET /gyms/new
  def new
    @gym = Gym.new
  end

  # GET /gyms/1/edit
  def edit
  end

  # POST /gyms
  def create
    @gym = Gym.new(gym_params)

    if @gym.save
      redirect_to @gym, notice: 'La salle a été ajoutée'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /gyms/1
  def update
    if @gym.update(gym_params)
      redirect_to @gym, notice: 'La salle a été modifiée'
    else
      render action: 'edit'
    end
  end

  # DELETE /gyms/1
  def destroy
    @gym.destroy
    redirect_to gyms_url, notice: 'La salle a été supprimée '
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gym
      @gym = Gym.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gym_params
      params.require(:gym).permit(:name, :adress, :zip, :city, :federation_id)
    end


end
