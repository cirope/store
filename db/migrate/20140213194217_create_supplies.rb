class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.decimal :quantity, precision: 10, scale: 2, null: false
      t.references :item, null: false, index: true
      t.references :warehouse, null: false, index: true

      t.timestamps
    end

    add_index :supplies, :quantity
  end
end
