class PostsController < ApplicationController
  def create
    @post = Post.new(params[:post])
    if @post.save
      render partial: 'post_element'
    end
  end
end