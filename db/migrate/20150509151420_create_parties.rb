class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name
      t.string :party_type
      t.string :one_time
      t.string :partner_no
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country

      t.timestamps null: false
    end
  end
end
