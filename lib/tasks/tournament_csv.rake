require 'csv'

namespace :take_from_csv do                                                                                                                                         
	desc "Import UPL(Ukrainian Premier League) table data from tournament.csv. Import home games of the UPL team from home_games.csv. Import away games of the UPL team from away_games.csv"
	task(tournament: :environment) do
		file = "lib/tasks/tournament.csv" 
		Home.delete_all
		Away.delete_all
		Tournament.delete_all
		CSV.foreach(file, :headers => true) do |row|
			Tournament.create ({ :place => row[0], :club => row[1], :points => row[2] })	
	    end
	    @tournaments = Tournament.all
	    @homes = Home.all
	    @aways = Away.all
	    @tournaments.each do |tournament|
	    	some_team = tournament.club.delete('«').delete('»')
	    	some_team_chars = some_team.chars
            n = some_team_chars.find_index(" ")
            some_team = some_team.delete(' ')
            chosen_team = some_team[0..n-1]
            hg_file = "lib/tasks/home_games.csv"
		    CSV.foreach(hg_file, :headers => true) do |hg_row|
		    	hg_row[1] = hg_row[1].delete(',').delete('і').gsub(/[а-я]/, '').gsub(/[А-Я]/, '')
		    	if (chosen_team == hg_row[2])
		    		tournament.homes.create ({ :tour => hg_row[0], :match_date => hg_row[1], :home_team => hg_row[2], :result => hg_row[3], :away_team => hg_row[4] })
	            end	
	        end
	        ag_file = "lib/tasks/away_games.csv"
		    CSV.foreach(ag_file, :headers => true) do |ag_row|
		    	ag_row[1] = ag_row[1].delete(',').delete('і').gsub(/[а-я]/, '').gsub(/[А-Я]/, '')
		    	if (chosen_team == ag_row[4])
		    		tournament.aways.create ({ :tour => ag_row[0], :match_date => ag_row[1], :home_team => ag_row[2], :result => ag_row[3], :away_team => ag_row[4] })
	            end	
	        end	 	    	
	    end 
	end
end