# ************************************************************************************
# session_controller.rb  
#
# @author Crescenzio Fabio
# @author Fresco Alain
# @author Therisod Romain
# @author Triki Mohamed
# @author Walpen Laurian
# 
# Ce fichier définit le contrôleur pour l'entité session
# Il permet de gérer l'authentification
# ************************************************************************************
class SessionsController < ApplicationController
  def new
  	@title = "S'identidier"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: "false" }
    end
  end


 def create
    if request.format.json?
      timekeeper = Timekeeper.authenticate(params[:login],params[:password])
    else
      timekeeper = Member.authenticate(params[:session][:login],
                                           params[:session][:password])
    end

    if timekeeper.nil?
      flash[:error] = "Combinaison Login/Mot de passe invalide."
      redirect_to "/signin"
    else

      if request.format.json?
        @test = sign_in timekeeper
         respond_to do |format|
          format.html # index.html.erb
          format.json { render json: cookies[:remember_token]}
        end
      else
        sign_in timekeeper
        redirect_to timekeeper
      end
    end
  end	

  def destroy
  	sign_out
    redirect_to "/signin"
  end
end
