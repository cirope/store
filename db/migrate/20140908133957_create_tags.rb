class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.references :account, null: false, index: true

      t.timestamps
    end

    add_index :tags, :name
  end
end
