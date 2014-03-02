class FacebookBuddy

  def initialize(user_id)
    @user_id = user_id
  end

  def like_button_source_url
    '//www.facebook.com/plugins/like.php?href=http%3A%2F%2Fguarded-journey-5941.herokuapp.com%2Fusers%2F' + @user_id.to_s + '&amp;width&amp;layout=button_count&amp;action=like&amp;show_faces=true&amp;share=true&amp;height=21&amp;appId=548149488617364'
  end
end