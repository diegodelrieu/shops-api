class Api::V1::MessagesController < Api::V1::BaseController
  respond_to :json
  skip_before_action :authenticate_customer!, only: [:index, :create]
  skip_after_action :verify_authorized

  def index
    @messages = Message.all
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      response = { message: 'Message created successfully' }
      render json: response, status: :created
    else
      render json: @message.errors, status: :bad
    end
  end

  private

  def message_params
    params.require(:message).permit(:ToUserName, :FromUserName, :CreateTime, :MsgType, :Content, :MsgId)
  end

  def render_error
    render json: { errors: @message.errors.full_messages },
      status: :unprocessable_entity
  end

end
