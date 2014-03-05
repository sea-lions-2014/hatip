class Tip < ActiveRecord::Base
	attr_accessible :coinbase_id, :post_id, :fiat_iso, :fiat_cents, :crypto_iso, :crypto_cents, :tx_hash, :tx_id, :status, :receive_address, :user_id
	belongs_to :user
	# validates :tx_hash, length: { is: 64 }

	# after_create :update_hype

	# def update_hype
	# 	user = User.find(user_id)
	# 	HypeBuddy.new(user, self.fiat_cents).add_tip_hype
	# end

end