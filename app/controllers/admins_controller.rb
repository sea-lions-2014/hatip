class AdminsController < ApplicationController
  # before_filter :admin_only!

  def index
    @unverified_users = User.find_all_by_verified(false)
    render :layout => false
  end

  def revoke_verification
    @verified_users = User.find_all_by_verified(true)
      render :layout => false
  end
end