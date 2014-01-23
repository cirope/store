class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.integer :number, null: false
      t.references :customer, null: false, index: true
      t.references :book, null: false, index: true
      t.references :account, null: false, index: true
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end

    add_index :receipts, :number
  end
end
