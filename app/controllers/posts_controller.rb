class PostsController < ApplicationController
  respond_to :json

  def show
  end


  def create
    @post = Post.new(params[:post])
    @post.user = User.find(params[:user_id])
    if @post.save
      render :nothing => true, :status => :ok
    else
      render :json => { :errors => @post.errors.full_messages }.to_json.html_safe, :status => 422
    end
  end
end