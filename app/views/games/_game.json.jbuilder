json.extract! game, :id, :location, :address, :start, :stop, :name, :sport, :description, :created_at, :updated_at
json.url game_url(game, format: :json)
