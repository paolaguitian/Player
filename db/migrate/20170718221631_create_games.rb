class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :location
      t.string :address
      t.datetime :start
      t.datetime :stop
      t.string :name
      t.string :sport
      t.text :description
    

      t.timestamps
    end
  end
end
