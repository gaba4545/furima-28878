class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :price  ,null: false
      t.string  :postal_code ,null: false
      t.integer :shipping_origin_area_id ,null: false
      t.string  :municipality ,null: false
      t.string  :building_number ,null: false
      t.string  :address ,null: false
      t.integer :purchase_history_id ,foreign_key: true
      t.timestamps
    end
  end
end