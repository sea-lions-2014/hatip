class FacebookBuddy

  def initialize(user_id)
    @user_id = user_id
  end

  def like_button_source_url
    '//www.facebook.com/plugins/like.php?href=http%3A%2F%2Fguarded-journey-5941.herokuapp.com%2Fusers%2F' + @user_id.to_s + '&amp;width&amp;layout=button_count&amp;action=like&amp;share=true&amp;height=21&amp;appId=548149488617364'
  end

  def get_user_likes
    Users.all.each do |user|
      #call JS function that pings https://graph.facebook.com/fql?q=SELECT url, normalized_url, share_count, like_count, comment_count, total_count,commentsbox_count, comments_fbid, click_count FROM link_stat WHERE url='http://www.google.com'
      #retuns json

    end
  end

end