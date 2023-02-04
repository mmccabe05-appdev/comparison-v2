json.extract! city, :id, :name, :location, :lat, :lng, :neighborhoods_count, :created_at, :updated_at
json.url city_url(city, format: :json)
