class CoinbaseBuddy
  def initialize(custom_options)
    @custom_options = custom_options
    @client = Coinbase::Client.new(ENV['COINBASE_API_KEY'], ENV['COINBASE_API_SECRET'])
  end

  def merged_options
    { button: button_defaults.merge(@custom_options) }
  end

  def button
    @client.create_button("#", 1, '#', '#', merged_options)
  end

  def iframe_embed_html
    button.embed_html
  end

  def button_defaults
      {
        name: "NAME PLACEHOLDER",
        type: 'donation',
        style: 'custom_small',
        text: 'tip!',
        price_currency_iso: "USD",
        description: "Tip",
        price_string: '1',
        custom: "CUSTOM PLACEHOLDER",
        callback_url: 'http://guarded-journey-5941.herokuapp.com/callback',
        variable_price: true,
        choose_price: true,
        price1: '0.5',
        price2: '1',
        price3: '2',
        price4: '5',
        price5: '10'
      }
  end
end