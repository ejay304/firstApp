# ************************************************************************************
# team.rb  
#
# @author Crescenzio Fabio
# @author Fresco Alain
# @author Therisod Romain
# @author Triki Mohamed
# @author Walpen Laurian
# 
# Ce fichier définit le modèle pour l'entité équipe
#     
# ************************************************************************************
class Team < ActiveRecord::Base
  belongs_to :club
  belongs_to :referee
  has_many :matches

  has_many :participantTeams
  has_many :participants, :through => :participantTeams

  attr_accessible :name, :homeColor, :awayColor, :club_id

  def players 
  	self.participants.find(:all, :conditions => {:type => 'Player'})
  end

 def display_name
    "#{name} -  #{club.name}"
  end

  def coach
    self.participants.find_by_type("Coach")
  end
end
