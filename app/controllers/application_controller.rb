class ApplicationController < ActionController::Base

  #before_action :authenticate_customer!
  #before_action :authenticate_shop!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :wechat_id])
  end

end
