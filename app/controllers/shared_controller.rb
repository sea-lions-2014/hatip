class SharedController < ApplicationController
  before_filter :redirect_if_empty_profile

  def index
	 @posts = Post.paginate(:page => params[:page], :per_page => 8)
  end
end
