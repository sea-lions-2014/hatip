class User < ActiveRecord::Base
  has_many :posts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name,
                  :last_name, :password_hash, :stage_name, :twitter_handle, :verified,
                  :tagline, :city, :state, :country, :genre, :story, :profile_image_url


  # Should refactor and put youtube functionality into module

  def highlight_youtube_url
    video_id = youtube_id(self.posts.first.youtube_url)
    youtube_embed_url(video_id)
  end

  def highlight_thumbnail_url
    video_id = youtube_id(self.posts.first.youtube_url)
    youtube_thumbnail_url(video_id)
  end

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

  def youtube_thumbnail_url(video_id)
    "http://img.youtube.com/vi/#{ video_id }/1.jpg"
  end

  def name
    self.first_name + ' ' + self.last_name
  end

  def card_data
    { name: self.name, highlight_youtube_url: self.highlight_youtube_url, story: self.story }
  end

  def self.find_for_facebook_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      # user.name = auth.info.name   # assuming the user model has a name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      # user.image = auth.info.image # assuming the user model has an image
    end
  end

  def self.new_with_session(params, session)
     super.tap do |user|
       if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
         user.email = data["email"] if user.email.blank?
       end
     end
   end
end

