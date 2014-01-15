# ************************************************************************************
# referee.rb  
#
# @author Crescenzio Fabio
# @author Fresco Alain
# @author Therisod Romain
# @author Triki Mohamed
# @author Walpen Laurian
# 
# Ce fichier définit le modèle pour l'entité arbitre qui est une enfant de 
# particpant
#     
# ************************************************************************************
class Referee < Participant
	has_many :matches
end
