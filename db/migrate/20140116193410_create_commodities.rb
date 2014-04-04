class CreateCommodities < ActiveRecord::Migration
  def change
    create_table :commodities do |t|
      t.string :name, null: false
      t.decimal :price, null: false, precision: 15, scale: 2
      t.references :classification, null: false, polymorphic: true, index: true
      t.references :account, null: false, index: true
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end

    add_index :commodities, :name
  end
end
