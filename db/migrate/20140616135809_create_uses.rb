class CreateUses < ActiveRecord::Migration
  def change
    create_table :uses do |t|
      t.references :bound, index: true
      t.references :item, index: true
      t.decimal :quantity

      t.timestamps
    end
  end
end
