class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :purchase_order_no
      t.string :order_type

      t.timestamps null: false
    end
  end
end
