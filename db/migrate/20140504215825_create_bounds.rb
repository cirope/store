class CreateBounds < ActiveRecord::Migration
  def change
    create_table :bounds do |t|
      t.references :user, index: true
      t.text :notes
      t.references :bondable, index: true, polymorphic: true, null: false

      t.timestamps
    end
  end
end
