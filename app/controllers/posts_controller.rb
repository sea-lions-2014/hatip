class PostsController < ApplicationController
  def create
    @post = Post.new(params[:post])
    @post.user = User.find(params[:user_id])
    @post.save
  end
end