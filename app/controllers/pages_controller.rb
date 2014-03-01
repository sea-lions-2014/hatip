class PagesController < ApplicationController
  def index
    @posts = Post.find(:all, :limit => 20)
  end
end
