class ApplicationController < ActionController::Base
  protect_from_forgery

  def redirect_if_empty_profile
    if current_user && current_user.needs_to_create_profile
      redirect_to edit_user_path(current_user)
    end
  end

  def admin_only!
    if current_user
      redirect_to root_path unless User.first == true
    else
      redirect_to root_path
    end
  end

  # helper_method :set_current_user

  # def after_sign_in_path_for(resource)
  #   stored_location_for(resource) ||
  #     if resource.is_a?(User)
  #       user_path
  #     else
  #       super
  #     end
  # end

  helper_method :after_sign_in_path_for
end
