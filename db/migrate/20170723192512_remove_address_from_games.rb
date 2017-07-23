class RemoveAddressFromGames < ActiveRecord::Migration[5.1]
  def change
    remove_column :games, :address 
  end
end
