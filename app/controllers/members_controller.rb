# ************************************************************************************
# members_controller.rb  
#
# @author Crescenzio Fabio
# @author Fresco Alain
# @author Therisod Romain
# @author Triki Mohamed
# @author Walpen Laurian
# 
# Ce fichier définit le contrôleur pour l'entité membre
#     
# ************************************************************************************
class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate

  # GET /members
  def index
    @members = Member.all
  end

  # GET /members/1
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  def create
    @member = Member.new(member_params)

    if @member.save
      sign_in @member
      redirect_to @member, notice: 'Le membre a été ajouté'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /members/1
  def update
    if @member.update(member_params)
      redirect_to @member, notice: 'Le membre a été modifié'
    else
      render action: 'edit'
    end
  end

  # DELETE /members/1
  def destroy
    @member.destroy
    redirect_to members_url, notice: 'Le membre a été supprimé'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def member_params
      params.require(:member).permit(:name, :firstname, :login, :phone, :email, :password, :federation_id)
    end
end
