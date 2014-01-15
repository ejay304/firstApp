# ************************************************************************************
# clubs_controller.rb  
#
# @author Crescenzio Fabio
# @author Fresco Alain
# @author Therisod Romain
# @author Triki Mohamed
# @author Walpen Laurian
# 
# Ce fichier définit le contrôleur pour l'entité club
#     
# ************************************************************************************
class ClubsController < ApplicationController
  before_action :set_club, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate

  # GET /clubs
  def index
    @clubs = Club.all

    respond_to do |format|
      format.html 
      format.json { render json: @clubs }
    end
  end

  # GET /clubs/1
  def show

    respond_to do |format|
      format.html 
      format.json { render json: @club }
    end
  end

  # GET /clubs/new
  def new
    @club = Club.new
  end

  # GET /clubs/1/edit
  def edit
  end

  # POST /clubs
  def create
    @club = Club.new(club_params)

    if @club.save
      redirect_to @club, notice: 'Le club a été ajoutée'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /clubs/1
  def update
    if @club.update(club_params)
      redirect_to @club, notice: 'Le club a été modifiée'
    else
      render action: 'edit'
    end
  end

  # DELETE /clubs/1
  def destroy
    @club.destroy
    redirect_to clubs_url, notice: 'Le club a été supprimée'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def club_params
      params.require(:club).permit(:name, :adress, :zip, :city)
    end
end
