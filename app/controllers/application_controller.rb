class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :nickname, :about_me, :age, :address])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :nickname, :about_me, :age, :address])
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
    # devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/ || params[:controller] = "bookings" || params[:controller] == "dashboards"
  end

end
