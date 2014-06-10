class ChangeBoundsTimeColumns < ActiveRecord::Migration
  def change
    change_table :bounds do |t|
      t.remove :start
      t.remove :finish
      t.integer :duration
    end
  end
end
