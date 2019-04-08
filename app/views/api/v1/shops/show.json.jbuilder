json.extract! @shop, :id, :name, :address, :avatar_url, :description, :opening_hours, :rating_from_diaping
json.goods @shop.items do |item|
  json.extract! item, :id, :description, :name, :original_price, :discount_price, :quantity, :expiry_time
end
