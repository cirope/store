module WarehousesHelper
  def warehouse_supplies
    @warehouse.supplies.new if @warehouse.supplies.empty?

    @warehouse.supplies
  end

  def available_warehouses
    @_available_warehouses ||= Warehouse.all
  end

  def default_warehouse
    Warehouse.default
  end

  def multiple_warehouses?
    available_warehouses.size > 1
  end
end
