class User < ActiveRecord::Base
  has_many :posts
  has_many :tips

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name,
                  :last_name, :password_hash, :stage_name, :twitter_handle, :verified,
                  :tagline, :city, :state, :country, :genre, :story, :profile_image_url,
                  :featured_youtube_url



  def highlight_youtube_url
    YoutubeBuddy.new(featured_youtube_url).iframe_html
  end

  def highlight_thumbnail_url
    YoutubeBuddy.new(featured_youtube_url).thumbnail_url
  end

  def name
    self.first_name + ' ' + self.last_name
  end

  # Possible deletion, repetition with post card data

  # def card_data
  #   { name: self.name, highlight_youtube_url: self.highlight_youtube_url, story: self.story, user_page_url: Rails.application.routes.url_helpers.user_path(self) }
  # end

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

