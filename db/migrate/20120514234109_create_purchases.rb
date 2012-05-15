class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :purchaser_name, :null => false, :default => ''
      t.string :item_description, :null => false, :default => ''
      t.decimal :item_price, :precision => 8, :scale => 2, :null => false, :default => 0.00
      t.integer :purchase_count, :null => false, :default => 0
      t.string :merchant_address, :null => false, :default => ''
      t.string :merchant_name, :null => false, :default => ''

      t.timestamps
    end
  end
end
