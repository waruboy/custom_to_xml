class CreateOrdersParties < ActiveRecord::Migration
  def change
    create_table :orders_parties, id: false do |t|
      t.references :order, null: false
      t.references :party, null: false

      t.timestamps null: false
    end
    add_index :orders_parties, [:order_id, :party_id], unique: true
  end
end
