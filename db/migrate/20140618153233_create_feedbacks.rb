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
  end
end
