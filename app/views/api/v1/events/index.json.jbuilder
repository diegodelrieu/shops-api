json.events do
  json.array! @events do |event|
    json.extract! event, :id, :description, :timestamp, :page, :customer_id, :item_id, :shop_id
  end
end
