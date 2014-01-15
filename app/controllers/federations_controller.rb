# ************************************************************************************
# federations_controller.rb  
#
# @author Crescenzio Fabio
# @author Fresco Alain
# @author Therisod Romain
# @author Triki Mohamed
# @author Walpen Laurian
# 
# Ce fichier définit le contrôleur pour l'entité fédérations
#     
# ************************************************************************************
class FederationsController < ApplicationController
  before_action :set_federation, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate

  # GET /federations
  def index
    @federations = Federation.all

    respond_to do |format|
      format.html 
      format.json { render json: @federations }
    end
  end

  # GET /federations/1
  def show

    respond_to do |format|
      format.html 
      format.json { render json: @federation }
    end
  end

  # GET /federations/new
  def new
    @federation = Federation.new
  end

  # GET /federations/1/edit
  def edit
  end

  # POST /federations
  def create
    @federation = Federation.new(federation_params)

    if @federation.save
      redirect_to @federation, notice: 'La fédération a été ajoutée'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /federations/1
  def update
    if @federation.update(federation_params)
      redirect_to @federation, notice: 'La fédération a été modifiée'
    else
      render action: 'edit'
    end
  end

  # DELETE /federations/1
  def destroy
    @federation.destroy
    redirect_to federations_url, notice: 'La fédération a été supprimée'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_federation
      @federation = Federation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def federation_params
      params.require(:federation).permit(:name)
    end
end
