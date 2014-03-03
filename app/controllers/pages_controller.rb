class PagesController < ApplicationController
  before_filter :redirect_if_empty_profile

  def index
    @posts = Post.find(:all, :limit => 20)
  end
end
