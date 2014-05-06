class AddStartAndFinishToBounds < ActiveRecord::Migration
  def change
    change_table :bounds do |t|
      t.time :start
      t.time :finish
    end
  end
end
