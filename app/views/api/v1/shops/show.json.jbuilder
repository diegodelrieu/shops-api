json.extract! @shop, :id, :name, :address, :avatar_url, :description, :opening_hours, :rating_from_diaping
json.goods @restaurant.goods do |good|
  json.extract! good, :id, :description, :name, :original_price, :discount_price, :quantity, :expiry_time
end
