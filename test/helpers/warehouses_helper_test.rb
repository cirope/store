require 'test_helper'

class WarehousesHelperTest < ActionView::TestCase
  test 'warehouse supplies' do
    @warehouse = warehouses :cirope_hq

    assert_equal @warehouse.supplies, warehouse_supplies

    @warehouse = Warehouse.new

    assert_equal 1, warehouse_supplies.size
    assert warehouse_supplies.all?(&:new_record?)
  end

  test 'available warehouses' do
    assert_respond_to available_warehouses, :each
  end

  test 'default warehouse' do
    assert_kind_of Warehouse, default_warehouse
  end

  test 'multiple warehouses' do
    def available_warehouses; [1]; end

    assert !multiple_warehouses?

    def available_warehouses; [1, 2]; end

    assert multiple_warehouses?
  end
end
