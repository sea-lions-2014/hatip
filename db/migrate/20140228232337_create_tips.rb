class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.integer :amount
      t.string :currency_iso
      t.string :order_id
      t.string :receive_address
      t.string :tx_id
      t.string :tx_hash
      t.string :tipper_email
    end
  end
end
