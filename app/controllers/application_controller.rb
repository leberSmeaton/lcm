class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_sanitized_params, if: :devise_controller?
  # before_action :configure_permitted_parameters, if: :devise_controller? 

  protected
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up) {|u| 
  #     u.permit(:fullname, :username, :email, :password,:password_confirmation)} 
  #   end

  def configure_sanitized_params
      devise_parameter_sanitizer.permit(:sign_up) do |u|
          u.permit(:fullname, :username, :email, :profile_info, :password, :password_confirmation, address_attributes: [:address_street, :address_state, :address_country, :address_postcode])
      end
  end
end
