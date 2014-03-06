class HypeBuddy
	def initialize(post)
		@post = post
	end

	def get_dollars
		@fiat_cents / 100
	end

	 def raw_hype_score
    tip_amount = calculate_total_tips
    fb_likes = @post.fb_likes
    hype_score = tip_amount + fb_likes
  end

  def current_hype
    gravity = 0.3
    age = (Time.now - @post.created_at) / 3600
    score = raw_hype_score / age ** gravity
    score.round
  end

  def calculate_total_tips
    Tip.where(user_id: @post.user.id).sum(:fiat_cents) / 100
  end

  def update_hype_score
    FacebookBuddy.update_post_likes(@post)
    @post.update_attributes(hype: current_hype)
  end
end