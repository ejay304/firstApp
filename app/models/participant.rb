# ************************************************************************************
# participant.rb  
#
# @author Crescenzio Fabio
# @author Fresco Alain
# @author Therisod Romain
# @author Triki Mohamed
# @author Walpen Laurian
# 
# Ce fichier définit le modèle pour l'entité participant
#     
# ************************************************************************************
class Participant < ActiveRecord::Base
	attr_accessible :name, :firstname, :birthday, :phone, :sexe, :type, :noDossard, :no_license, :dateQualification

	has_many :participantsTeams
	has_many :teams, :through => :participantsTeams


	self.inheritance_column = :type 
	def self.name_FR(type)
		case type
		when "Coach"
			"entraineur"
		when "Referee"
			"arbitre"
		when "Player"
			"joueur"
		end
	end

	def path
		case self.type
		when "Coach"
			"/coaches"
		when "Referee"
			"/referees"
		when "Player"
			"/players"
		end
		
	end

    def display_name
    	"#{self.name} #{self.firstname}"
  	end

  	def sexeString
  		if !self.sexe then
  			"Masculin"
  		else
			"Feminin"
		end
  	end
	def name_FR
		Participant.name_FR(self.type)
	end
end
