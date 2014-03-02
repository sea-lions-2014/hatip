class ApplicationController < ActionController::Base
  protect_from_forgery

  def admin_only!
    if current_user
      redirect_to root_path unless User.first == true
    else
      redirect_to root_path
    end
  end


def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
      if resource.is_a?(User)
        user_path
      else
        super
      end
  end

  helper_method :after_sign_in_path_for
end
