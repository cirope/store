class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.references :organization, index: true, null: false
      t.references :user, index: true, null: false

      t.timestamps
    end

    add_index :relations, [:organization_id, :user_id], unique: true
  end
end
