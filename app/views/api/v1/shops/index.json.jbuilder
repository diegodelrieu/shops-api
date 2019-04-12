json.shops do
  json.array! @shops do |shop|
    json.extract! shop, :id, :name, :address, :avatar_url, :description, :longitude, :latitude, :phone_number, :opening_hours, :rating_from_diaping
  end
end
