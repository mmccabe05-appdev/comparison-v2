json.extract! neighborhood, :id, :name, :city_id, :lat, :lng, :favorite_neighborhoods_count, :created_at, :updated_at
json.url neighborhood_url(neighborhood, format: :json)
