class Game < ApplicationRecord
  has_many :comments
  has_many :game_players
  has_many :users, through: :game_players
  geocoded_by :location   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
end
