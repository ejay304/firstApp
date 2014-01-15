# ************************************************************************************
# participants_team.rb  
#
# @author Crescenzio Fabio
# @author Fresco Alain
# @author Therisod Romain
# @author Triki Mohamed
# @author Walpen Laurian
# 
# Ce fichier définit la relation entre les entité Participant et Equipe
#     
# ************************************************************************************
class ParticipantTeam < ActiveRecord::Base
	
	belongs_to :team
	belongs_to :participant
end
