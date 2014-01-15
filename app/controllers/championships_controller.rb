# ************************************************************************************
# championships_controller.rb  
#
# @author Crescenzio Fabio
# @author Fresco Alain
# @author Therisod Romain
# @author Triki Mohamed
# @author Walpen Laurian
# 
# Ce fichier définit le contrôleur pour l'entité championnat
#     
# ************************************************************************************

class ChampionshipsController < ApplicationController
  before_action :set_championship, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate

  # GET /championships
  def index
    @championships = Championship.all

    respond_to do |format|
      format.html 
      format.json { render json: @championships }
    end
  end

  # GET /championships/1
  def show
    respond_to do |format|
      format.html 
      format.json { render json: @championship }
    end
  end

  # GET /championships/new
  def new
    @championship = Championship.new
  end

  # GET /championships/1/edit
  def edit
  end

  # POST /championships
  def create
    @championship = Championship.new(championship_params)

    if @championship.save
      redirect_to @championship, notice: 'Le championnat a été ajouté'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /championships/1
  def update
    if @championship.update(championship_params)
      redirect_to @championship, notice: 'Le championnat a été modifié'
    else
      render action: 'edit'
    end
  end

  # DELETE /championships/1
  def destroy
    @championship.destroy
    redirect_to championships_url, notice: 'Le championnat a été supprmié'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_championship
      @championship = Championship.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def championship_params
      params.require(:championship).permit(:name, :federation_id, :season_id)
    end
end
