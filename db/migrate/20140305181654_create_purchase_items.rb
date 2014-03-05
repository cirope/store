class CreatePurchaseItems < ActiveRecord::Migration
  def change
    create_table :purchase_items do |t|
      t.references :item, null: false, index: true
      t.string :unit, null: false
      t.decimal :quantity, precision: 10, scale: 2, null: false
      t.decimal :price, precision: 15, scale: 2
      t.references :purchase, null: false, index: true

      t.timestamps
    end
  end
end
