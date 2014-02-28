class Post < ActiveRecord::Base
  attr_accessible :youtube_url, :title, :description, :hype
  belongs_to :user

  def youtube_id(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end
  end

  def youtube_embed_url(video_id)
    "http://www.youtube.com/embed/#{ video_id }?controls=1&showinfo=0&rel=0"
  end

  def youtube_thumbnail_url
    "http://img.youtube.com/vi/#{ self.youtube_id(self.youtube_url) }/1.jpg"
  end

  def card_data
    { artist_name: self.user.name, title: self.title, youtube_embed_url: self.youtube_embed_url(self.youtube_id(self.youtube_url)), description: self.description, artist_page_url: Rails.application.routes.url_helpers.user_path(self.user) }
  end

end