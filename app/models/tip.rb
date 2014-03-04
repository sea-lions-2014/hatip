class Tip < ActiveRecord::Base
	attr_accessible :coinbase_id, :post_id, :fiat_iso, :fiat_cents, :crypto_iso, :crypto_cents, :tx_hash, :tx_id, :status, :receive_address
	belongs_to :user
	validates :tx_hash, length: { is: 64 }

	on_create :update_hype

	def update_hype
		post = Post.find(self.post_id)
		HypeBuddy.new(post, self.fiat_cents).add_tip_hype
	end
end