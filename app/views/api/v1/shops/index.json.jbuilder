json.shops do
  json.array! @shops do |shop|
    json.extract! shop, :id, :name, :address, :avatar_url, :description, :opening_hours, :rating_from_diaping
  end
end
