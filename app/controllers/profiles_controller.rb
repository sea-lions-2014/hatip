class ProfilesController < ApplicationController

  def show
   @user = User.find(params[:id])
   p params
  end

  def edit
    # if !current_user

    # else
    # end
  end

  def update
  end

  def destroy
  end

end