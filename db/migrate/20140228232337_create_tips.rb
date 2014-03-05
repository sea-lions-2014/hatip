class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.belongs_to  :user
      t.string      :coinbase_id
      t.string      :post_id
      t.string      :fiat_iso
      t.integer     :fiat_cents
      t.string      :crypto_iso
      t.integer     :crypto_cents
      t.string      :tx_hash
      t.string      :tx_id
      t.string      :status
      t.string      :receive_address

      t.timestamps
    end
  end
end
