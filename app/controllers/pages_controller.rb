class PagesController < ApplicationController
  before_filter :redirect_if_empty_profile

  def index
	@posts = Post.paginate(:page => params[:page], :per_page => 8)
  end

  def explore
    posts = Post.all
    @post = posts.sample
    @video_id = YoutubeBuddy.new(@post.youtube_url).youtube_id
    @next_post = posts.sample
    @next_user = User.find(@next_post.user_id)
  end

  def show_music
    posts = Post.where(category: "music")
    render partial: 'shared/post_cards', :locals => {:@posts => posts}
  end

  def show_dance
    posts = Post.where(category: "dance")
    render partial: 'shared/post_cards', :locals => {:@posts => posts}
  end

  def show_acrobatic
    posts = Post.where(category: "acrobat")
    render partial: 'shared/post_cards', :locals => {:@posts => posts}
  end

  def show_other
    posts = Post.where(category: "other")
    render partial: 'shared/post_cards', :locals => {:@posts => posts}
  end
end
