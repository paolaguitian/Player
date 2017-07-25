json.extract! game, :id, :location, :start, :stop, :sport, :description, :created_at, :updated_at
json.url game_url(game, format: :json)
