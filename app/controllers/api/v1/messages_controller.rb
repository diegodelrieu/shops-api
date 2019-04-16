class Api::V1::MessagesController < Api::V1::BaseController
  respond_to :json
  skip_before_action :authenticate_customer!

  def index
    @messages = Message.all
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      response = { message: 'Message created successfully' }
      render json: response, status: :created
    else
      render json: @shop.errors, status: :bad
    end
  end

  def message_params
    params.require(:message).permit(:ToUserName, :FromUserName, :CreateTime, :MsgType, :Content, :MsgId)
  end

end
