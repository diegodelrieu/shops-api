class Api::V1::CustomersController < Api::V1::BaseController
  respond_to :json
  acts_as_token_authentication_handler_for Customer, only: [ :show, :index ]
  before_action :set_customer, only: [:show]
  skip_before_action :authenticate_customer!, only: [:index, :show, :create, :new]
  skip_after_action :verify_authorized

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      render :show, status: :created
    else
      render_error
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
    params.require(:customer).permit(:email, :password, :name, :wechat_id)
  end

  def render_error
    render json: { errors: @customer.errors.full_messages },
      status: :unprocessable_entity
  end
end
