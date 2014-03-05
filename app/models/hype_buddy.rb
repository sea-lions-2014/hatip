class HypeBuddy < ActiveRecord::Base
	def initialize(user, fiat_cents)
		@user = user
		@fiat_cents = fiat_cents
	end

	def add_tip_hype
		@user.update_attributes(hype_score: ( @user.hype_score + get_dollars.ceil ))
	end

	def get_dollars
		@fiat_cents/100
	end


end