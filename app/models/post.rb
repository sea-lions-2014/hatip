class Post < ActiveRecord::Base
  attr_accessible :youtube_url, :title, :description, :hype
  belongs_to :user

  def embed_url
    YoutubeBuddy.new(youtube_url).embed_url
  end
end