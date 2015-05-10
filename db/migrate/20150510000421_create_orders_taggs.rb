class CreateOrdersTaggs < ActiveRecord::Migration
  def change
    create_table :orders_taggs do |t|
      t.references :order, null: false
      t.references :tagg, null: false

      t.timestamps null: false
    end
    add_index :orders_taggs, [:order_id, :tagg_id], unique: true
  end
end
