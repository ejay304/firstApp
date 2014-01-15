# ************************************************************************************
# fact.rb  
#
# @author Crescenzio Fabio
# @author Fresco Alain
# @author Therisod Romain
# @author Triki Mohamed
# @author Walpen Laurian
# 
# Ce fichier définit le modèle pour l'entité fait
#     
# ************************************************************************************
class Fact < ActiveRecord::Base
	attr_accessible :time, :type, :match_id, :player_id
	belongs_to :match
	belongs_to :player
	
	self.inheritance_column = :type 
end
