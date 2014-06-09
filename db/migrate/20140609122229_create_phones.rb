class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :phone
      t.references :entity, index: true

      t.timestamps
    end
  end
end
