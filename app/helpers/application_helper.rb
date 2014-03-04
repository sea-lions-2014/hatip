module ApplicationHelper
  # I don't like this here, not sure where yet.
  def may_edit_profile
    current_user ? current_user.id == params[:id] || current_user.id == @user.id : false
  end
end
