json.users do
  json.array! @users do |user|
    json.extract! user, :userId, :openId, :nickName, :gender, :language, :city, :province, :country, :avatarUrl
  end
end
