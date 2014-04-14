class AddIssuedAtToReceipts < ActiveRecord::Migration
  def change
    add_column :receipts, :issued_at, :date, null: false
    add_index :receipts, :issued_at
  end
end
