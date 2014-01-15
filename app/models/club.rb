# ************************************************************************************
# club.rb  
#
# @author Crescenzio Fabio
# @author Fresco Alain
# @author Therisod Romain
# @author Triki Mohamed
# @author Walpen Laurian
# 
# Ce fichier définit le modèle pour l'entité club
#     
# ************************************************************************************
class Club < ActiveRecord::Base
	has_many :timekeeper

	attr_accessible :name, :adress, :zip, :city
end
