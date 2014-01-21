class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :number, null: false
      t.references :customer, index: true
      t.foreign_key :customers, options: FOREIGN_KEY_OPTIONS
      t.references :book, null: false, index: true
      t.foreign_key :books, options: FOREIGN_KEY_OPTIONS
      t.references :account, null: false, index: true
      t.foreign_key :accounts, options: FOREIGN_KEY_OPTIONS
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end

    add_index :invoices, :number
  end
end
