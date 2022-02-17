class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :nickname, :age, :address])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
    # devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(keys: [:first_name, :last_name, :email, :password]) }
    # devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :current_password) }
  end
end
