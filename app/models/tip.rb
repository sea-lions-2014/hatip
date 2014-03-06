class Tip < ActiveRecord::Base
	attr_accessible :coinbase_id, :post_id, :fiat_iso, :fiat_cents, :crypto_iso, :crypto_cents, :tx_hash, :tx_id, :status, :receive_address, :stripe_email, :stripe_token
	belongs_to :user
	# validates :tx_hash, length: { is: 64 }

  def build_from_callback(data)
    tip_info = CoinbaseBuddy.parse_callback(data)
    user.tips.build(tip_info)
  end

  def self.build_stripe_tip(data)
    puts "building tip"
    StripeBuddy.build_tip(data)
  end
end

###################
# Coinbase callback data looks like this:

# {"order"=>
  # { "id"=>"ATNON22I",
  #   "created_at"=>"2014-03-01T16:46:37-08:00",
  #   "status"=>"completed",
  #   "total_btc"=>
  #     {
  #       "cents"=>43650,
  #       "currency_iso"=>"BTC"
  #     },
  #   "total_native"=>

  #     {
  #       "cents"=>25,
  #       "currency_iso"=>"USD"
  #     },
  #   "custom"=>"#user{ self.user.id }-post{ self.id }",
  #   "receive_address"=>"1JVPjWF9igFFzSdYCSegpWZX2XdJv3p945",
  #   "button"=>
  #     {
  #       "type"=>"donation",
  #       "name"=>"Tip for Alicia Hartmann",
  #       "description"=>"Tip",
  #       "id"=>"f6b64e664a9d6c05d5d236f301d560dc"
  #       },
  #   "transaction"=>
  #       {
  #         "id"=>"5312800a4ed082d08a0045ea",
  #       "hash"=>"6c7e54414d613d5a0323bfa0caa93b232ce2a1fea1bbcc94630e860db5c805c4",
  #       "confirmations"=>0
  #     }
  # },
  # "action"=>"create",
  # "controller"=>"tips",
  # "tip"=>{}
# }