class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.references :organization, index: true, null: false
      t.foreign_key :organizations, options: FOREIGN_KEY_OPTIONS
      t.references :user, index: true, null: false
      t.foreign_key :users, options: FOREIGN_KEY_OPTIONS

      t.timestamps
    end

    add_index :relations, [:organization_id, :user_id], unique: true
  end
end
