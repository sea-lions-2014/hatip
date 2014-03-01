class ApplicationController < ActionController::Base
  protect_from_forgery

  def admin_only!
    if current_user
      redirect_to root_path unless User.first == true
    else
      redirect_to root_path
    end
  end


end
