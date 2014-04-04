class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :code, null: false
      t.string :unit, null: false

      t.timestamps
    end

    add_index :items, :code
  end
end
