# ************************************************************************************
# facts_controller.rb  
#
# @author Crescenzio Fabio
# @author Fresco Alain
# @author Therisod Romain
# @author Triki Mohamed
# @author Walpen Laurian
# 
# Ce fichier définit le contrôleur pour l'entité faits
#     
# ************************************************************************************
  class FactsController < ApplicationController
  before_filter :authenticate

  # GET /facts
  # GET /facts.json
  def index
    @facts = fact_type.all
    @title = fact_type

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @facts }
    end
  end

  # GET /facts/1
  # GET /facts/1.json
  def show
  end

  # GET /facts/new
  # GET /facts/new.json
  def new
    @fact = fact_type.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fact }
    end
  end

  # GET /facts/1/edit
  def edit
    @fact = fact_type.find(fact_params)
  end

  # POST /facts
  # POST /facts.json
  def create

    @fact = fact_type.new(fact_params)

    respond_to do |format|
      if @fact.save
        format.html { redirect_to @fact, notice: 'Fact was successfully created.' }
        format.json { render json: @fact, status: :created, location: @fact }
      else
        format.html { render action: "new" }
        format.json { render json: @fact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /facts/1
  # PUT /facts/1.json
  def update
    @fact = Fact.find(fact_params)

    respond_to do |format|
      if @fact.update_attributes(fact_params)
        format.html { redirect_to @fact, notice: 'Fact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facts/1
  # DELETE /facts/1.json
  def destroy
    @fact = Fact.find(fact_params)
    @fact.destroy

    respond_to do |format|
      format.html { redirect_to facts_url }
      format.json { head :no_content }
    end
  end

  private
  def fact_type
    params[:type].constantize
  end

  def fact_params
      params.require(:fact).permit(:time, :match_id,:type, :player_id)
    end
end
