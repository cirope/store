class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :number, null: false
      t.references :customer, index: true
      t.references :organization, null: false, index: true
      t.references :account, null: false, index: true
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end

    add_index :invoices, :number
  end
end
