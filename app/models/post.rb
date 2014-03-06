class Post < ActiveRecord::Base

  attr_accessible :youtube_url, :title, :description, :hype, :fb_likes, :category

  belongs_to :user

  validates :youtube_url, presence: true
  validates :title, presence: true
  validates_uniqueness_of :youtube_url, scope: :user_id

  validate :validate_youtube_url
  # before_save :save_youtube_id

  # def save_youtube_id
  #   self.youtube_id = self.youtube_url.split('v=')[1]
  # end

  include PgSearch
  pg_search_scope :search, against: [:title, :description],
    using: { tsearch: { dictionary: "english" } },
    associated_against: { user: [:stage_name, :country] }

  def self.text_search(query)
    if query.present?
      search(query)
    else
      scoped
    end
  end

  def post_embed
    YoutubeBuddy.new(youtube_url).iframe_html
  end

  def youtube_id
    YoutubeBuddy.new(youtube_url).youtube_id
  end

  def thumbnail_url
    YoutubeBuddy.new(youtube_url).thumbnail_url
  end

  def post_youtube_url
    YoutubeBuddy.new(youtube_url).youtube_embed_url
  end

  def facebook_like_url
    FacebookBuddy.post_like_button_source_url(self.id)
  end

  def current_hype
    HypeBuddy.new(self).current_hype
  end

  def card_data
    tip_button_options = {
      name: "Tip for #{ self.user.name }",
      custom: "{ user_id: #{ self.user.id }, post_id: #{ self.id } }"
    }
    cb_button = CoinbaseBuddy.new(tip_button_options).button
    tip_button_html = cb_button.embed_html
    tip_button_code = cb_button.button.code

    {
      artist_name: self.user.name,
      artist_id: self.id,
      title: self.title,
      youtube_id: self.youtube_id,
      description: self.description,
      artist_page_url: Rails.application.routes.url_helpers.user_path(self.user),
      payment_button: tip_button_html,
      facebook_like_url: facebook_like_url,
      button_code: tip_button_code
    }
  end

  def validate_youtube_url
    unless YoutubeBuddy.new(youtube_url).valid_video?
      errors.add(:youtube_url, "is not valid")
    end
  end
end