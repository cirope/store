require 'test_helper'

class WarehousesHelperTest < ActionView::TestCase
  test 'warehouse supplies' do
    @warehouse = warehouses :cirope_hq

    assert_equal @warehouse.supplies, warehouse_supplies

    @warehouse = Warehouse.new

    assert_equal 1, warehouse_supplies.size
    assert warehouse_supplies.all?(&:new_record?)
  end
end
