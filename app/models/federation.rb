# ************************************************************************************
# federation.rb  
#
# @author Crescenzio Fabio
# @author Fresco Alain
# @author Therisod Romain
# @author Triki Mohamed
# @author Walpen Laurian
# 
# Ce fichier définit le modèle pour l'entité fédération 
#     
# ************************************************************************************

class Federation < ActiveRecord::Base

	has_many :championships 
  	has_many :members
  	has_many :gyms

  	attr_accessible :name
end
