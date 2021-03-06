class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.references :account, null: false, index: true
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
  end
end
