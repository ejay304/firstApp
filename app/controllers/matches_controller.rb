# ************************************************************************************
# matches_controller.rb  
#
# @author Crescenzio Fabio
# @author Fresco Alain
# @author Therisod Romain
# @author Triki Mohamed
# @author Walpen Laurian
# 
# Ce fichier définit le contrôleur pour l'entité match
#     
# ************************************************************************************
class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy, :matchsheet]
  before_filter :authenticate

  skip_before_filter :verify_authenticity_token, :only => [:matchsheet]


  # GET /matches
  def index
    @matches = Match.all

    respond_to do |format|
      format.html #
      format.json { render json: @matches }
    end
  end

  # GET /matches/1
  def show
    @match = Match.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @match }
    end
  end

  # GET /matches/new
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  def create
    @match = Match.new(match_params)

    if @match.save
      redirect_to @match, notice: 'Match ajouté correctement'
    else
      render action: 'new'
    end
  end 

  #POST /matches/matchsheet/1
  def matchsheet
    logger.info "Params = #{params}"
    params["facts"].each do |f|
      @match.facts << Fact.new(f)
    end
    @match.update(match_params)
    render json: "true"
  end

  # PATCH/PUT /matches/1
  def update
    if @match.update(match_params)
      redirect_to @match, notice: 'Le match a été mis à jour'
    else
      render action: 'edit'
    end
  end

  # DELETE /matches/1
  def destroy
    @match.destroy
    redirect_to matches_url, notice: 'Le match à été supprimé'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def match_params
      params.require(:match).permit(:date, :homeScore, :awayScore, :championship_id, :gym_id, :team_id1_id, :team_id2_id, :referee_id)
    end
end
