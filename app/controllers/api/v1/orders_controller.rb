class Api::V1::OrdersController < Api::V1::BaseController
  respond_to :json
  skip_before_action :authenticate_customer!, only: [:index, :show, :create, :new, :update]
  acts_as_token_authentication_handler_for Customer, only: [ :create ]
  skip_after_action :verify_authorized

  def index
    @orders = policy_scope(Order)
  end

  def new
    @order = Order.new
  end

  def create
    @order =  Order.new(order_params)
    if @order.save
      response = { message: 'Order created successfully', order_id: @order.id }
      render json: response, status: :created
    else
      render_error
    end
  end

  def pundit_user
    current_customer
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:item_id, :customer_id, :booked)
  end

  def render_error
    render json: { errors: @order.errors.full_messages },
      status: :unprocessable_entity
  end
end
