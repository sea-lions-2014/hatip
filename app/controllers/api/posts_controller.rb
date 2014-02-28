class Api::PostsController < ApplicationController
  def show
    render json: Post.find(params[:id]).card_data
  end
end
