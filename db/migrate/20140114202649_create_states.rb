class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name, null: false
      t.references :account, null: false, index: true

      t.timestamps
    end
  end
end
