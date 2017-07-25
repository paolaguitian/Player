class RemoveNameFromGames < ActiveRecord::Migration[5.1]
  def change
    remove_column :games, :name
  end
end
