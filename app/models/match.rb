# ************************************************************************************
# match.rb  
#
# @author Crescenzio Fabio
# @author Fresco Alain
# @author Therisod Romain
# @author Triki Mohamed
# @author Walpen Laurian
# 
# Ce fichier définit le modèle pour l'entité match
#     
# ************************************************************************************
class Match < ActiveRecord::Base
  belongs_to :championship
  belongs_to :gym
  belongs_to :referee
  belongs_to :team, :class_name => "Team", :foreign_key => "team_id1_id"
  belongs_to :team, :class_name => "Team", :foreign_key => "team_id2_id"
  has_many :facts

  def team1
  	Team.find_by_id(self.team_id1_id)
  end

  def team2
  	Team.find_by_id(self.team_id2_id)
  end
end
