class PagesController < ApplicationController
  before_filter :redirect_if_empty_profile

  def index
    @posts = Post.find(:all, :limit => 20)
  end

  def explore
    posts = Post.all
    @post = posts.sample
    @video_id = @post.youtube_id
    @next_post = posts.sample
    @next_user = User.find(@next_post.user_id)
  end
end
