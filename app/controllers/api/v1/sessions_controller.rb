class Api::V1::SessionsController < Api::V1::BaseController
  def create
   customer = Customer.find_by_email(params[:customer][:email])

   if customer && customer.valid_password?(params[:customer][:password])

     response = { message: 'Customer sign in successfully', auth_token: customer.authentication_token }
     render json: response
   else
     render json: { errors: { 'email or password' => ['is invalid'] } }, status: :bad_request
   end
 end
end
