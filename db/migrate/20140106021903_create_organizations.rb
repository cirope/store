class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name, null: false
      t.string :subdomain, null: false
      t.integer :lock_version, default: 0, null: false

      t.timestamps
    end
  end
end
