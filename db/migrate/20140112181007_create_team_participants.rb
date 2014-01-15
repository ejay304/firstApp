class CreateTeamParticipants < ActiveRecord::Migration
	def self.up
    	execute <<-SQL
        CREATE VIEW `team_participants` AS select `participant_teams`.`team_id` AS `team_id`,`participant_teams`.`participant_id` AS `participant_id`,`participants`.`name` AS `participant_name`,`participants`.`firstname` AS `participant_firstname`,`participants`.`type` AS `type` from (`participants` join `participant_teams` on((`participant_teams`.`participant_id` = `participants`.`id`))) order by `participants`.`name`
     	SQL
  	end
  	def self.down
    	execute <<-SQL
      		DROP VIEW `player_facts`
    	SQL
  	end
end
