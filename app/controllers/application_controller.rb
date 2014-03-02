class ApplicationController < ActionController::Base
  protect_from_forgery

  # def set_current_user
  #   @user = current_user
  # end

  # helper_method :set_current_user

  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
      if resource.is_a?(User)
        edit_user_registration_path
      else
        super
      end
  end

end
