class ApplicationController < ActionController::Base
  # make current user available to all conrollers
  protect_from_forgery unless: -> { request.format.json? }

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :bio, :photo, :role) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :bio, :photo, :email, :password, :current_password, :role)
    end
  end
end
