class AddBirthToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :birth, :date
  end
end
