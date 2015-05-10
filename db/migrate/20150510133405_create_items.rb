class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.date :start_date
      t.date :cancel_date
      t.string :product_no
      t.string :size1
      t.integer :upc, limit: 16
      t.decimal :unit_price
      t.decimal :actual_price
      t.decimal :discount_percent
      t.integer :order_qty
      t.integer :ship_qty
      t.integer :cancel_qty

      t.timestamps null: false
    end
  end
end
