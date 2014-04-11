class AddIssuedAtToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :issued_at, :date
    add_index :invoices, :issued_at
  end
end
