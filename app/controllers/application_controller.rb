class ApplicationController < ActionController::Base
  before_action :authenticate_customer!
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit
  after_action :verify_authorized, except: :index, unless: :skip_pundit?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :wechat_id])
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
