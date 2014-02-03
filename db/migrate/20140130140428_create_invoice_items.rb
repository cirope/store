class CreateInvoiceItems < ActiveRecord::Migration
  def change
    create_table :invoice_items do |t|
      t.references :item, index: true
      t.decimal :quantity, precision: 10, scale: 2, null: false
      t.decimal :price, precision: 15, scale: 2, null: false
      t.references :invoice, index: true, null: false

      t.timestamps
    end
  end
end
