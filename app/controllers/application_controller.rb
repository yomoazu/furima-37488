class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :first_name, :first_name_furigana, :last_name, :last_name_furigana, :date_of_bath])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :encrypted_password])
  end
  end 

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
     username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
   end 
  end