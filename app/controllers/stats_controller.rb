class StatsController < ApplicationController
	layout "front_application"

	def show_home
	end

	def show_ranking
		@championship = Championship.find_by_name(params[:championship_name])
		@ranking = Ranking.where(championship_id: @championship.id)
  	end

	def show_played_matches
		@championship = Championship.find_by_name(params[:championship_name])
		@matches = MatchTeams.where(championship_id: @championship.id)
	end

	def show_future_matches
		@championship = Championship.find_by_name(params[:championship_name])
		@matches = MatchTeams.where(championship_id: @championship.id).order("date ASC")
	end

	def show_team
		@championship = Championship.find_by_name(params[:championship_name])
		@team = Team.find_by_name(params[:team_name])
		@coach = TeamCoach.find_by_team_id(@team.id)
		@players = ShowTeam.where(championship_id: @championship.id).where(team_id: @team.id)
		@nbMatches = MatchTeams.where(championship_id: @championship.id).where('(team1_id = ? OR team2_id = ?) AND homeScore IS NOT NULL AND awayScore IS NOT NULL', @team.id, @team.id).count
	end

	def show_match
		@championship = Championship.find_by_name(params[:championship_name])
		@match = MatchTeams.find_by_match_id(params[:match_id])
		@team1 = TeamParticipant.where(team_id: @match.team1_id).where(type: "Player")
		@team2 = TeamParticipant.where(team_id: @match.team2_id).where(type: "Player")
		@coach1 = TeamCoach.find_by_team_id(@match.team1_id)
		@coach2 = TeamCoach.find_by_team_id(@match.team2_id)
		@players1 = ShowMatch.where(championship_id: @championship.id).where(team_id: @match.team1_id)
		@players2 = ShowMatch.where(championship_id: @championship.id).where(team_id: @match.team2_id)
		@facts = TeamFact.where(championship_id: @championship.id).where(match_id: @match.match_id)
	end
end


