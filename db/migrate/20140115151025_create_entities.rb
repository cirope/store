class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :tax_id, null: false
      t.string :name, null: false
      t.string :tax_condition, null: false
      t.text :address
      t.references :city, null: false, index: true
      t.references :invoiceable, polymorphic: true, index: true
      t.references :account, null: false, index: true

      t.timestamps
    end

    add_index :entities, :tax_id
    add_index :entities, :name
  end
end
