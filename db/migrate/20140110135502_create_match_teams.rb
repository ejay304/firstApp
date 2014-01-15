class CreateMatchTeams < ActiveRecord::Migration
	def self.up
    	execute <<-SQL
        CREATE VIEW `match_teams` AS select `matches`.`championship_id` AS `championship_id`,`matches`.`id` AS `match_id`,`matches`.`date` AS `date`,`matches`.`homeScore` AS `homeScore`,`matches`.`awayScore` AS `awayScore`,`t1`.`id` AS `team1_id`,`t1`.`name` AS `team1_name`,`t2`.`id` AS `team2_id`,`t2`.`name` AS `team2_name`,`matches`.`referee_id` AS `referee_id`,`participants`.`name` AS `referee_name`,`participants`.`firstname` AS `referee_firstname` from (((`matches` join `teams` `t1` on((`t1`.`id` = `matches`.`team_id1_id`))) join `teams` `t2` on((`t2`.`id` = `matches`.`team_id2_id`))) join `participants` on((`participants`.`id` = `matches`.`referee_id`))) order by `matches`.`date` desc
      SQL
  	end
  	def self.down
    	execute <<-SQL
      		DROP VIEW `match_teams`
    	SQL
  	end
end
