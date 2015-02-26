class Game < ActiveRecord::Base
  has_many :character_games
  has_many :characters, through: :character_games

  accepts_nested_attributes_for :characters
end
