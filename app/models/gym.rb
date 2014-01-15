# ************************************************************************************
# gym.rb  
#
# @author Crescenzio Fabio
# @author Fresco Alain
# @author Therisod Romain
# @author Triki Mohamed
# @author Walpen Laurian
# 
# Ce fichier définit le modèle pour l'entité salle de sport
#     
# ************************************************************************************
class Gym < ActiveRecord::Base
  	belongs_to :federation
    has_many :matches

    attr_accessible :name, :adress, :zip, :city, :federation_id
end
