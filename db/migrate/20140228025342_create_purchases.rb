class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :number, null: false
      t.date :requested_at, null: false
      t.date :delivered_at
      t.references :book, null: false, index: true
      t.references :provider, null: false, index: true
      t.references :maker, null: false, index: true
      t.references :receiver, index: true
      t.references :account, null: false, index: true
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end

    add_index :purchases, :number
    add_index :purchases, :delivered_at
  end
end
