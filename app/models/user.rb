class User < ApplicationRecord
  has_many :game_players
  has_many :games, through: :game_players
end
