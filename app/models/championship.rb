# ************************************************************************************
# championship.rb  
#
# @author Crescenzio Fabio
# @author Fresco Alain
# @author Therisod Romain
# @author Triki Mohamed
# @author Walpen Laurian
# 
# Ce fichier définit le modèle pour l'entité championnat
#     
# ************************************************************************************
class Championship < ActiveRecord::Base
  	belongs_to :federation
  	belongs_to :season
    has_many :matchs

    attr_accessible :name, :federation_id, :season_id
end
