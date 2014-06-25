class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :score
      t.text :notes
      t.string :token, null: false
      t.references :customer, null: false, index: true
      t.references :owner, polymorphic: true, null: false, index: true
      t.references :account, null: false, index: true

      t.timestamps
    end

    add_index :feedbacks, :token, unique: true
    add_index :feedbacks, :score
    add_index :feedbacks, :updated_at
  end
end
