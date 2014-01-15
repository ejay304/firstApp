# ************************************************************************************
# timekeepers_controller.rb  
#
# @author Crescenzio Fabio
# @author Fresco Alain
# @author Therisod Romain
# @author Triki Mohamed
# @author Walpen Laurian
# 
# Ce fichier définit le contrôleur pour l'entité chronométreur
# ce ficheir gérer les utilisateurs qui se connecte via la tablette
# ************************************************************************************
class TimekeepersController < ApplicationController
  before_action :set_timekeeper, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate


  # GET /timekeepers
  def index
    @timekeepers = Timekeeper.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @timekeepers }
    end
  end

  # GET /timekeepers/1
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: nil }
    end
  end

  # GET /timekeepers/new
  def new
    @timekeeper = Timekeeper.new
  end

  # GET /timekeepers/1/edit
  def edit
  end

  # POST /timekeepers
  def create
    @timekeeper = Timekeeper.new(timekeeper_params)

    if @timekeeper.save
      sign_in @timekeeper
      redirect_to @timekeeper, notice: 'Le chronomètreur a été ajouté'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /timekeepers/1
  def update
    if @timekeeper.update(timekeeper_params)
      redirect_to @timekeeper, notice: 'Le chronomètreur a été modifié'
    else
      render action: 'edit'
    end
  end

  # DELETE /timekeepers/1
  def destroy
    @timekeeper.destroy
    redirect_to timekeepers_url, notice: 'Le chronomètreur a été supprimé'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timekeeper
      @timekeeper = Timekeeper.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def timekeeper_params
      params.require(:timekeeper).permit(:login, :password,:password_confirmation, :club_id)
    end
end
