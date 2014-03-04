class PostsController < ApplicationController
  respond_to :json

  def create
    user = User.find(params[:user_id])
    @post = user.posts.build params[:post]
    if @post.save
      render :nothing => true, :status => :ok
    else
      render :json => { :errors => @post.errors.full_messages }.to_json.html_safe, :status => 422
    end
  end
end
