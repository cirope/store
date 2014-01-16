class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :tax_id, null: false
      t.string :name, null: false
      t.text :address
      t.references :city, index: true
      t.references :account, null: false, index: true
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end

    add_index :customers, :tax_id
    add_index :customers, :name
  end
end
