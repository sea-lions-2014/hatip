module ApplicationHelper

  def may_edit_profile
    current_user ? current_user.id == params[:id] : false
  end

end
