class CreateReceiptItems < ActiveRecord::Migration
  def change
    create_table :receipt_items do |t|
      t.references :item, null: false, index: true
      t.decimal :quantity, precision: 10, scale: 2, null: false
      t.references :receipt, null: false, index: true

      t.timestamps
    end
  end
end
