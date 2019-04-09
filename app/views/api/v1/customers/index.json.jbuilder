json.customers do
  json.array! @customers do |customer|
    json.extract! customer, :id, :name, :email, :wechat_id
  end
end

