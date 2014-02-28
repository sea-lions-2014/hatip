class Post < ActiveRecord::Base
  attr_accessible :youtube_url, :title, :description, :hype
  belongs_to :user
end