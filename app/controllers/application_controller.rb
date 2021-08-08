class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_sanitized_params, if: :devise_controller?
  before_action :set_sample_products

  protected
  def configure_sanitized_params
      devise_parameter_sanitizer.permit(:sign_up) do |u|
          u.permit(:fullname, :username, :email, :profile_info, :password, :password_confirmation, address_attributes: [:address_street, :address_state, :address_country, :address_postcode])
      end

      devise_parameter_sanitizer.permit(:account_update) do |u|
          u.permit(:fullname, :username, :email, :profile_info, :password, :password_confirmation, :current_password, address_attributes: [:address_street, :address_state, :address_country, :address_postcode])
      end
  end

  private
    def set_sample_products
        @sample_products = Product.all.sample(4)
    end
end
