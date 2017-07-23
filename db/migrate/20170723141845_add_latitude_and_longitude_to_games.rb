class AddLatitudeAndLongitudeToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :latitude, :float
    add_column :games, :longitude, :float
  end
end
