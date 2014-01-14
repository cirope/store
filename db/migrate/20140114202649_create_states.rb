class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name, null: false
      t.references :organization, null: false, index: true

      t.timestamps
    end
  end
end
