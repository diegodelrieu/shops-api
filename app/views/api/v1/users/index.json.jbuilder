json.users do
  json.array! @users do |user|
    json.extract! user, :id, :open_id, :nickName, :gender, :language, :city, :province, :country, :avatarUrl
  end
end
