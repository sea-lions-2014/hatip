class User < ActiveRecord::Base
  has_many :posts
  has_many :tips
  before_save :set_profile_image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name,
                  :last_name, :password_hash, :stage_name, :twitter_handle, :verified,
                  :tagline, :city, :state, :country, :category, :story, :profile_image_url,
                  :featured_youtube_url, :is_admin, :hype_score

  # validates :category, inclusion: { in: %w(vocal instrumental dance acrobatic visual comedy),
  #                                   message: "%{value} is not a valid category" }

  def needs_to_create_profile
    [self.stage_name, self.category, self.featured_youtube_url, self.tagline].include?(nil)
  end

  def get_hype_score
    self.posts.length
  end

  def set_profile_image
    self.profile_image_url = "/assets/avatar.png" unless self.profile_image_url
  end

  def highlight_youtube_url
    YoutubeBuddy.new(featured_youtube_url).iframe_html
  end

  def highlight_thumbnail_url
    YoutubeBuddy.new(featured_youtube_url).thumbnail_url
  end

  def name
    self.first_name + ' ' + self.last_name
  end


  def self.find_for_facebook_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.stage_name = auth.info.name   # assuming the user model has a name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.profile_image_url = auth.info.image # assuming the user model has an image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
         user.email = data["email"] if user.email.blank?
      end
    end
  end

  def card_data
    tip_button_options = {
      name: "Tip for #{ self.name }",
      custom: "{ user_id: #{ self.id }, post_id: 'user_tip' }"
    }

    tip_button_html = CoinbaseBuddy.new(tip_button_options).iframe_embed_html

    {
      payment_button: tip_button_html,
    }
  end
end

