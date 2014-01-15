# ************************************************************************************
# teams_controller.rb  
#
# @author Crescenzio Fabio
# @author Fresco Alain
# @author Therisod Romain
# @author Triki Mohamed
# @author Walpen Laurian
# 
# Ce fichier définit le contrôleur pour l'entité équipe
#     
# ************************************************************************************
class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy, :getPlayers]
  before_filter :authenticate


  # GET /teams
  def index
    @teams = Team.all

    respond_to do |format|
      format.html #
      format.json { render json: @teams }
    end
  end

  # GET /teams/1
  def show
     @team = Team.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @team }
    end
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  def create

    @players = Participant.where(:id => params[:players_team])
    @team = Team.new(team_params)
    @coach = Coach.find(params[:coach][:coach_id])
    @team.participants << @coach 
    @team.participants << @players 

    if @team.save
      redirect_to @team, notice: "L'équipe à été ajoutée " 
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /teams/1
  def update
    @players = Participant.where(:id => params[:players_team])
    @team.participants.destroy_all   #disassociate the already added organizers
    @coach = Coach.find(params[:coach][:coach_id])
    @coach.type = "Coach"
    @team.participants << @coach 
    @team.participants << @players 
    if @team.update(team_params)
      redirect_to @team, notice: "L'équipe à été modifiée"
    else
      render action: 'edit'
    end
  end

  # DELETE /teams/1
  def destroy
    @team.destroy
    redirect_to teams_url, notice: "L'équipe à été supprimée"
  end

  # get /ranking/1
  def ranking
    @teams = Team.find(params[:id])
  end
  # Get /getPlayers/1  [json]
  def getPlayers
    render json: @team.players
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def team_params
      params.require(:team).permit(:name, :homeColor, :awayColor, :club_id)
    end
end
