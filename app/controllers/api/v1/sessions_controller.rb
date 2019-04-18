class Api::V1::SessionsController < Api::V1::BaseController
  #skip_before_action :authenticate_customer!, only: [:index, :show, :create, :new]
  def create
    if params[:customer]
      sign_in_as(:customer)
    else
      sign_in_as(:shop)
    end
 end

 private

 def sign_in_as(role)
  klass = role.to_s.capitalize.constantize

  customer_or_shop = klass.find_by_email(params[role][:email])

   if customer_or_shop && customer_or_shop.valid_password?(params[role][:password])

     response = { message: "#{klass} sign in successfully", auth_token: customer_or_shop.authentication_token }
     render json: response
   else
     render json: { errors: { 'email or password' => ['is invalid'] } }, status: :bad_request
   end
 end
end
