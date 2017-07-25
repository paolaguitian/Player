class Game < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :game_players
  has_many :users, through: :game_players
  geocoded_by :location   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  def self.search(search)
    where("location LIKE ? OR description LIKE ? OR sport LIKE ?",
      "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
