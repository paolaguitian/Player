class AddUsertogamePlayers < ActiveRecord::Migration[5.1]
  def change
    remove_column :game_players, :player_id, :integer
    add_column :game_players, :user_id, :integer
  end
end
