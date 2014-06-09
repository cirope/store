class RemoveTaxIdNullFromEntities < ActiveRecord::Migration
  def change
    change_column_null :entities, :tax_id, true
  end
end
