class Tip < ActiveRecord::Base
	attr_accessible :coinbase_id, :amount, :post_id, :fiat_iso, :fiat_cents, :crypto_iso, :tx_hash, :tx_id, :status, :receive_address
	belongs_to :user
	validates_presence_of :amount
	validates :tx_hash, length: { is: 64 }
end