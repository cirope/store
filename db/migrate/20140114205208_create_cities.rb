class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.string :zip_code, null: false
      t.references :state, null: false, index: true
      t.references :account, null: false, index: true

      t.timestamps
    end
  end
end
