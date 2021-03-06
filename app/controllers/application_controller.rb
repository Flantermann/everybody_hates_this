class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def default_url_options
    { host: ENV["www.everybody-hates-this.xyz"] || "localhost:3000" }
  end

  # heroku config:set DOMAIN=www.my_product.com (not necessary if set)
  # check if it works by typing: heroku config:get DOMAIN


  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :nickname, :about_me, :age, :address, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :nickname, :about_me, :age, :address, :photo])
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/ || params[:controller] == "contracts" || params[:controller] == "milestones"
    # devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/ || params[:controller] = "bookings" || params[:controller] == "dashboards"
  end

  protected

  def after_sign_in_path_for(resource)
    dashboard_path
  end

end
