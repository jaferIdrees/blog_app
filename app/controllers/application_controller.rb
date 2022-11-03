class ApplicationController < ActionController::Base
  # make current user available to all conrollers
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :role) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :surname, :email, :password, :current_password, :role)
    end
  end
end
