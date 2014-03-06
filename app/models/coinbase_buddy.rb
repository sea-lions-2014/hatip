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

  def self.parse_callback(data)
    order = data['order']
    custom_info = get_custom_info(order)
    user = User.find(custom_info[:user_id])
    tip_info = {
          coinbase_id:       order['id'],
          post_id:           custom_info[:post_id],
          fiat_iso:          order['total_native']['currency_iso'],
          fiat_cents:        order['total_native']['cents'],
          crypto_iso:        order['total_btc']['currency_iso'],
          crypto_cents:      order['total_btc']['cents'],
          tx_hash:           order['transaction']['hash'],
          tx_id:             order['transaction']['id'],
          status:            order['status'],
          receive_address:   order['receive_address']
        }
  end

  private

    def self.get_custom_info(order)
      unless invalid_custom_params?(order['custom'])
        eval(order['custom']) # creates hash from string encoded custom parameter
      else
        raise "callback data does not match expected Regexp"
      end
    end

    # Validate that string is encoded hash of params and not malicious code
    def self.invalid_custom_params?(order)
      /{ *\w{2,10}: \d+, *\w{2,10}: \d+ }/.match(order['custom']).nil?
    end
end