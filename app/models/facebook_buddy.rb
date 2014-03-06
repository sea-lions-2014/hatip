class FacebookBuddy

  # def initialize
  #   @user_id = user_id
  # end

  def self.user_like_button_source_url(user_id)
    '//www.facebook.com/plugins/like.php?href=http%3A%2F%2Fguarded-journey-5941.herokuapp.com%2Fusers%2F' + user_id.to_s + '&amp;width&amp;layout=button_count&amp;action=like&amp;share=true&amp;height=21&amp;appId=548149488617364'
  end

  def self.post_like_button_source_url(post_id)
    '//www.facebook.com/plugins/like.php?href=http%3A%2F%2Fguarded-journey-5941.herokuapp.com%2Fposts%2F' + post_id.to_s + '&amp;width&amp;layout=button_count&amp;action=like&amp;share=true&amp;height=21&amp;appId=548149488617364'
  end

  def self.like_count_path(post_id)
    app_base = 'http://guarded-journey-5941.herokuapp.com/'
    post_url = app_base + 'posts/' + post_id.to_s
    URI.encode("https://api.facebook.com/method/fql.query?query=select total_count,like_count,comment_count,share_count,click_count from link_stat where url='#{post_url}'&format=json")
  end

  def self.update_post_likes(post)
    response = HTTParty.get(like_count_path(post.id))
    like_count = response.parsed_response.first['like_count']
    post.update_attributes(fb_likes: like_count)
  end

end

#call JS function that pings https://graph.facebook.com/fql?q=SELECT url, normalized_url, share_count, like_count, comment_count, total_count,commentsbox_count, comments_fbid, click_count FROM link_stat WHERE url='http://www.google.com'
#retuns json

