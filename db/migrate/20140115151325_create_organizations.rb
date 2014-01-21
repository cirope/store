class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.references :account, null: false, index: true
      t.foreign_key :accounts, options: FOREIGN_KEY_OPTIONS
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
  end
end
