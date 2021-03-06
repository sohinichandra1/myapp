class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    puts params
    devise_parameter_sanitizer.permit(:sign_up, keys:[:email, :password, :password_confirmation, :street_address, :first_name, :last_name, :zip_code, :country, :state])
  end
end
