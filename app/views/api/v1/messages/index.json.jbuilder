json.messages do
  json.array! @messages do |message|
    json.extract! message, :ToUserName, :FromUserName, :CreateTime, :MsgType, :Content, :MsgId
  end
end
