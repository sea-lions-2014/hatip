class YoutubeBuddy < ActiveRecord::Base

  def initialize(youtube_url)
    @youtube_url = youtube_url
  end

  def youtube_id
    if @youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
      @youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end
  end

  def youtube_embed_url
    "http://www.youtube.com/embed/#{ youtube_id }?autoplay=1&controls=2&showinfo=0&rel=0"
  end

  def iframe_html(height=510, width=900)
    %Q{<iframe class="yt-iframe" title="YouTube video player" width="#{width}" height="#{height}" src="http://www.youtube.com/embed/#{ youtube_id }?controls=2&showinfo=0&rel=0"  frameborder="0" allowfullscreen></iframe>}
  end

  def thumbnail_url
    "http://img.youtube.com/vi/#{ youtube_id }/0.jpg"
  end

  def valid_video?
    return false if youtube_id.nil?
    r = HTTParty.get('http://gdata.youtube.com/feeds/api/videos/' + youtube_id).response
    r.class == Net::HTTPOK
  end
end
