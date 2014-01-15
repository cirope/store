class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.references :account, index: true, null: false
      t.references :user, index: true, null: false

      t.timestamps
    end

    add_index :relations, [:account_id, :user_id], unique: true
  end
end
