class CreateItemsOrders < ActiveRecord::Migration
  def change
    create_table :items_orders, id: false do |t|
    	t.references :item, null: false
    	t.references :order, null:false

    	t.timestamps null:false
    end
    add_index :items_orders, [:item_id, :order_id], unique: true
  end
end
