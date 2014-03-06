class TagsController < ApplicationController
  def autocomplete_tag_name
    posts = Post.select(:title).where("title LIKE ?", "%#{params[:query]}%")
    result = posts.collect do |t|
      { value: t.title }
    end
    render json: result
  end
end