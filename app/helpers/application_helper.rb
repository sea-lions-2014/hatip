module ApplicationHelper
  def may_edit_profile
    current_user ? current_user.id == params[:id] : false
  end

  def youtube_embed(youtube_url, height=390, width=640)

    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end

    %Q{<iframe title="YouTube video player" width="#{width}" height="#{height}" src="http://www.youtube.com/embed/#{ youtube_id }?controls=0&showinfo=0&rel=0"  frameborder="0" allowfullscreen></iframe>}
  end

end
