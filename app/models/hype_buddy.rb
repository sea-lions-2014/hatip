class HypeBuddy < ActiveRecord::Base
	def initialize(post, fiat_cents)
		@post = post
		@fiat_cents = fiat_cents
	end

	def add_tip_hype
		@post.update_attributes(hype: ( @post.hype + get_dollars.ceil ))
	end

	def get_dollars
		@fiat_cents/100
	end


end