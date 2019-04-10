json.orders do
  json.array! @orders do |order|
    json.extract! order, :id, :customer_id, :item_id, :booked
  end
end
