class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post = Post.new
  end

  def edit
    @user = current_user
  end

  def update
  end

  def destroy
  end

end