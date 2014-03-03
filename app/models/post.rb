class Post < ActiveRecord::Base
  attr_accessible :youtube_url, :title, :description, :hype
  belongs_to :user

  validates :youtube_url, presence: true
  validates :title, presence: true
  validates_uniqueness_of :youtube_url, scope: :user_id

  validate :validate_youtube_url

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
    FacebookBuddy.new(self.user.id).like_button_source_url
  end


  def card_data

    coinbase = Coinbase::Client.new(ENV['COINBASE_API_KEY'], ENV['COINBASE_API_SECRET'])

    opts = {
              button:
              {
                name: "Tip for #{ self.user.name }",
                type: 'donation',
                style: 'custom_small',
                text: 'tip!',
                price_currency_iso: "USD",
                description: "Tip",
                price_string: '1',
                custom: "{ user_id: #{ self.user.id }, post_id: #{ self.id } }",
                callback_url: 'http://guarded-journey-5941.herokuapp.com/callback',
                variable_price: true,
                choose_price: true,
                price1: '0.5',
                price2: '1',
                price3: '2',
                price4: '5',
                price5: '10'
              }
            }
    button = coinbase.create_button("Tip for #{ self.user.name }", 1, 'b', 'b', opts)

    {
      artist_name: self.user.name,
      title: self.title,
      youtube_id: self.youtube_id,
      description: self.description,
      artist_page_url: Rails.application.routes.url_helpers.user_path(self.user),
      payment_button: button.embed_html,
      facebook_like_url: facebook_like_url,
    }
  end

  def validate_youtube_url
    unless YoutubeBuddy.new(youtube_url).valid_video?
      errors.add(:youtube_url, "is not valid")
    end
  end
end