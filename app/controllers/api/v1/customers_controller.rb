class Api::V1::CustomersController < Api::V1::BaseController
  respond_to :json
  acts_as_token_authentication_handler_for Customer, only: [ :show, :index ]
  before_action :set_customer, only: [:show]
  #skip_before_action :authenticate_customer!, only: [:index, :show, :create, :new]
  skip_after_action :verify_authorized

  def index
    @customers = Customer.all
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      response = { message: 'Customer created successfully', auth_token: @customer.authentication_token, customer_id: @customer.id }
      render json: response, status: :created
    else
      render json: @customer.errors, status: :bad
    end
  end

  def pundit_user
    current_customer
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
    authorize @customer
  end

  def customer_params
    params.require(:customer).permit(:email, :password, :name, :wechat_id, :address)
  end

  def render_error
    render json: { errors: @customer.errors.full_messages },
      status: :unprocessable_entity
  end
end
