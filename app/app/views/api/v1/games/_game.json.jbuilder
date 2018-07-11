json.extract! game, :id, :right, :wrong, :created_at, :updated_at
json.url api_v1_game_url(game, format: :json)
