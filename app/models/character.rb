class Character < ActiveRecord::Base
  has_many :character_games
  has_many :games, through: :character_games
end
