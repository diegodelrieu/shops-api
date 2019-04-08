class Api::V1::CustomersController < Api::V1::BaseController
  def create
    @customer = Customer.create(customer_params)
    if @customer.save
      response = { message: 'Customer created successfully', auth_token: @customer.authentication_token }
      render json: response, status: :created
    else
      render json: @customer.errors, status: :bad
    end
  end



  private

  def customer_params
    params.require(:customer).permit(:email, :password, :name, :wechat_id)
  end
end
