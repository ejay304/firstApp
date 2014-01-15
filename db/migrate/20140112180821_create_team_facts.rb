class CreateTeamFacts < ActiveRecord::Migration
	def self.up
    	execute <<-SQL
        CREATE VIEW `team_facts` AS select `matches`.`championship_id` AS `championship_id`,`participant_teams`.`team_id` AS `team_id`,`teams`.`name` AS `team_name`,`matches`.`id` AS `match_id`,`participant_teams`.`participant_id` AS `participant_id`,`participants`.`name` AS `participant_name`,`participants`.`firstname` AS `participant_firstname`,`facts`.`id` AS `fact_id`,`facts`.`type` AS `fact_type`,`facts`.`time` AS `fact_time` from ((((`participants` join `facts` on((`facts`.`player_id` = `participants`.`id`))) join `participant_teams` on((`facts`.`player_id` = `participant_teams`.`participant_id`))) join `matches` on(((`matches`.`id` = `facts`.`match_id`) and ((`participant_teams`.`team_id` = `matches`.`team_id1_id`) or (`participant_teams`.`team_id` = `matches`.`team_id2_id`))))) join `teams` on((`participant_teams`.`team_id` = `teams`.`id`))) order by `facts`.`time`
     	SQL
  	end
  	def self.down
    	execute <<-SQL
      		DROP VIEW `team_facts`
    	SQL
  	end
end
