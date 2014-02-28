module ApplicationHelper

def may_edit_profile
 current_user.id == params[:id]
end

end
