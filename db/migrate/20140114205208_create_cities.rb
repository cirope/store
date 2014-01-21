class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.string :zip_code, null: false
      t.references :state, null: false, index: true
      t.foreign_key :states, options: FOREIGN_KEY_OPTIONS
      t.references :account, null: false, index: true
      t.foreign_key :accounts, options: FOREIGN_KEY_OPTIONS

      t.timestamps
    end
  end
end
