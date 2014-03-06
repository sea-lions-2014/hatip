class StripeBuddy

  def self.create_tip(params)
    # Get the credit card details submitted by the form
    token = params[:stripe_token][:id]
    email = params[:email]
    amount = 100
    post_id = params[:id]
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => amount, # amount in cents, again
        :currency => "usd",
        :card => token,
        :description => email
      )
      Post.find(post_id).user.tips.create!(fiat_cents: amount, stripe_email: email, stripe_token: token)
      return "success"
    rescue Stripe::CardError => e
      return "payment failed"
    end
  end
end