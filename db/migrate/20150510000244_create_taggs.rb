class CreateTaggs < ActiveRecord::Migration
  def change
    create_table :taggs do |t|
      t.string :context
      t.string :value

      t.timestamps null: false
    end
  end
end
