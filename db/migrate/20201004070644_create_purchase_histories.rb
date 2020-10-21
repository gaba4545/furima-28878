class CreatePurchaseHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_histories do |t|
      t.integer :item_id ,null: false , foreign_key: true
      t.integer :user_id ,null: false , foreign_key: true
      t.timestamps
    end
  end
end