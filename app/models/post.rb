class Post < ActiveRecord::Base
  attr_accessible :youtube_url, :title, :description, :hype
  belongs_to :user

  def youtube_id
    YoutubeBuddy.new(youtube_url).youtube_id
  end

  def thumbnail_url
    YoutubeBuddy.new(youtube_url).thumbnail_url
  end

  def card_data
    # coinbase = Coinbase::Client.new(ENV['COINBASE_API_KEY'], ENV['COINBASE_API_SECRET'])
    # button  = coinbase.create_button "Tip for #{self.user.name}"

    { artist_name: self.user.name,
      title: self.title,
      youtube_id: self.youtube_id,
      description: self.description,
      artist_page_url: Rails.application.routes.url_helpers.user_path(self.user)
    }
  end
end