json.events do
  json.array! @events do |event|
    json.extract! event, :id, :description, :timestamp
  end
end
