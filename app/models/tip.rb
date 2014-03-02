class Tip < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :amount
	validates :tx_hash, length: { is: 64 }
end