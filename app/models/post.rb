class Post < ActiveRecord::Base
  attr_accessible :youtube_url, :title, :description, :hype
  belongs_to :user

  def post_embed
    YoutubeBuddy.new(youtube_url).iframe_html
  end

  def youtube_id
    YoutubeBuddy.new(youtube_url).youtube_id
  end

  def thumbnail_url
    YoutubeBuddy.new(youtube_url).thumbnail_url
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
                custom: "#user{ self.user.id }-post{ self.id }",
                callback_url: 'http://www.hatip.com/callback',
                variable_price: true,
                choose_price: true,
                price1: '0.5',
                price2: '1',
                price3: '2',
                price4: '5',
                price5: '10'
              }
            }
    button = coinbase.create_button("Tip for #{ self.user.name }", 0, 'b', 'b', opts)

    {
      artist_name: self.user.name,
      title: self.title,
      youtube_id: self.youtube_id,
      description: self.description,
      artist_page_url: Rails.application.routes.url_helpers.user_path(self.user),
      payment_button: button.embed_html
    }
  end
end