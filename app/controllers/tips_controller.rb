class TipsController < ApplicationController
  def create
    tip = Tip.build_from_callback(params)
    if tip.save
      render json: { success: "success" }
    else
      render json: { error: "error" }
    end
  end

  def create_stripe_tip
    Stripe.api_key = ENV['STRIPE_API_KEY']
    success_status = StripeBuddy.create_tip(params)
    render json: { status: success_status }
  end
end

#   def create_stripe_tip
#     begin
#       tip = Tip.build_stripe_tip(params)
#       tip.save ? render json: { success: "success" } : render json: { error: "invalid params" }
#     rescue
#       render json: { error: "Payment " }


#   end
# end


###################
# Coinbase callback data looks like this:

# {"order"=>
	# {	"id"=>"ATNON22I",
	# 	"created_at"=>"2014-03-01T16:46:37-08:00",
	# 	"status"=>"completed",
	# 	"total_btc"=>
	# 		{
	# 	  	"cents"=>43650,
	# 	   	"currency_iso"=>"BTC"
	# 		},
	# 	"total_native"=>

	# 		{
	# 			"cents"=>25,
	# 			"currency_iso"=>"USD"
	# 		},
	# 	"custom"=>"#user{ self.user.id }-post{ self.id }",
	# 	"receive_address"=>"1JVPjWF9igFFzSdYCSegpWZX2XdJv3p945",
	# 	"button"=>
	# 		{
	# 			"type"=>"donation",
	# 			"name"=>"Tip for Alicia Hartmann",
	# 			"description"=>"Tip",
	# 			"id"=>"f6b64e664a9d6c05d5d236f301d560dc"
	# 			},
	# 	"transaction"=>
	# 			{
	# 				"id"=>"5312800a4ed082d08a0045ea",
	# 			"hash"=>"6c7e54414d613d5a0323bfa0caa93b232ce2a1fea1bbcc94630e860db5c805c4",
	# 			"confirmations"=>0
	# 		}
	# },
	# "action"=>"create",
	# "controller"=>"tips",
	# "tip"=>{}
# }
