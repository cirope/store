class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :kind, null: false
      t.string :flow, null: false
      t.integer :last_used_number, null: false, default: 0
      t.references :organization, null: false, index: true
      t.references :account, null: false, index: true
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
  end
end
