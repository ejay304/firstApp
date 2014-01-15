class CreateShowMatches < ActiveRecord::Migration
	def self.up
    	execute <<-SQL
        CREATE VIEW `show_matches` AS select distinct `team_facts`.`championship_id` AS `championship_id`,`team_facts`.`team_id` AS `team_id`,`team_facts`.`team_name` AS `team_name`,`team_facts`.`match_id` AS `match_id`,`team_facts`.`participant_id` AS `participant_id`,`team_facts`.`participant_name` AS `participant_name`,`team_facts`.`participant_firstname` AS `participant_firstname`,(select count(0) from `team_facts` `facts` where ((`team_facts`.`championship_id` = `facts`.`championship_id`) and (`team_facts`.`team_id` = `facts`.`team_id`) and (`team_facts`.`participant_id` = `facts`.`participant_id`) and ((`facts`.`fact_type` = 'Goal') or (`facts`.`fact_type` = 'Penalty')))) AS `goal`,(select count(0) from `team_facts` `facts` where ((`team_facts`.`championship_id` = `facts`.`championship_id`) and (`team_facts`.`team_id` = `facts`.`team_id`) and (`team_facts`.`participant_id` = `facts`.`participant_id`) and (`facts`.`fact_type` = 'Foul'))) AS `foul`,(select count(0) from `team_facts` `facts` where ((`team_facts`.`championship_id` = `facts`.`championship_id`) and (`team_facts`.`team_id` = `facts`.`team_id`) and (`team_facts`.`participant_id` = `facts`.`participant_id`) and (`facts`.`fact_type` = 'YellowCard'))) AS `yellow_card`,(select count(0) from `team_facts` `facts` where ((`team_facts`.`championship_id` = `facts`.`championship_id`) and (`team_facts`.`team_id` = `facts`.`team_id`) and (`team_facts`.`participant_id` = `facts`.`participant_id`) and (`facts`.`fact_type` = 'RedCard'))) AS `red_card` from `team_facts`
     	SQL
  	end
  	def self.down
    	execute <<-SQL
      		DROP VIEW `show_matches`
    	SQL
  	end
end
