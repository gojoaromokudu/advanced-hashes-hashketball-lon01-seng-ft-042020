require "pry"

def game_hash
  hash = {}
  
  #top-level keys
  hash[:home] = {}
  hash[:away] = {}
  
  #team-level keys
  hash[:home] = {
    :team_name => "Brooklyn Nets",
    :colors => ["Black","White"],
    :players =>[
      stats = {
        :player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },
      
      stats = {
        :player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },
      
      stats = {
        :player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },
      
      stats = {
        :player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },
      
      stats = {
        :player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }
    ]
  }
  
  hash[:away] = {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise","Purple"],
    :players =>[
      stats = {
        :player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },
      
      stats = {
        :player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
      },
      
      stats = {
        :player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },
      
      stats = {
        :player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
      
      stats = {
        :player_name => "Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12
      }
    ]
  }
   hash
end

def get_players
  players = game_hash.keys.map do |team|
    game_hash[team][:players]
  end
  players.flatten
end

def num_points_scored(player_name)
  found_player = get_players.find do |player|
    player[:player_name] == player_name
    end
 found_player[:points]
end

def shoe_size(player_name)
  found_player = get_players.find do |player|
    player[:player_name] == player_name
    end
 found_player[:shoe]
end

def team_colors(team_name)
  data = game_hash
colors = nil
  data.each do |key,value|
  if value[:team_name] == team_name
  colors = value[:colors]
    end
  end
  colors
  
  #this isnt working for some reason: will come back to it
  
  # selected_team = data.find do |team|
  #   team[:team_name] == team_name
  #   selected_team[:colors]
end

def team_names
  team_names = []
  game_hash.each do |team, team_data|
    team_names << team_data[:team_name]
  end
  team_names
end

def player_numbers(team_name)
  jersey_numbers = []
  the_team = nil
  
  game_hash.each_value do |team|
    if team_name == team[:team_name]
      the_team = team
    end
  end
  
  the_team[:players].each do |player|
   jersey_numbers << player[:number]
  end
  jersey_numbers
end

def player_stats(player_name)
  player_stats = {}
  game_hash.each_value do |team|
    team[:players].each do |player|
    #  binding.pry
      if player_name == player[:player_name]
        player_stats = player.delete(:player_name)
      end
    end
  end
  
end

