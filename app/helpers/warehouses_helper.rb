module WarehousesHelper
  def warehouse_supplies
    @warehouse.supplies.new if @warehouse.supplies.empty?

    @warehouse.supplies
  end
end
