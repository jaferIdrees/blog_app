class ApplicationController < ActionController::Base
  # make current user available to all conrollers
  def current_user
    User.first
  end
end
