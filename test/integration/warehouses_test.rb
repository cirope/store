require 'test_helper'

class WarehousesTest < ActionDispatch::IntegrationTest
  include CommodityTestHelper

  test 'should create a warehouse' do
    login

    visit new_warehouse_path
    fill_in_new_warehouse

    add_commodity items(:candy), 10, 1
    add_commodity items(:chocolate), 10, 2

    assert_difference 'Warehouse.count' do
      assert_difference 'Supply.count', 2 do
        find('.btn.btn-primary').click
      end
    end
  end

  test 'should remove warehouse relations' do
    warehouse = warehouses :cirope_hq

    login

    visit edit_warehouse_path(warehouse)

    page.find('#supplies fieldset:nth-child(1)').hover

    within '#supplies fieldset:nth-child(1)' do
      find('a[data-dynamic-form-event="hideItem"]').click
    end

    assert_difference 'warehouse.supplies.count', -1 do
      find('.btn.btn-primary').click
    end
  end

  test 'should add new commodity' do
    login

    visit new_warehouse_path
    fill_in_new_warehouse

    add_new_commodity prefix: 'warehouse_supplies'
  end

  private

    def fill_in_new_warehouse
      fill_in 'warehouse_name', with: 'Alternative warehouse'
    end

    def add_commodity commodity, quantity, index
      click_link I18n.t('warehouses.new.supply') if index > 1

      within "#supplies fieldset:nth-child(#{index})" do
        input_id = find('input[name$="[commodity]"]')[:id]
        page.execute_script "$('##{input_id}').focus().val('#{commodity.name}').keydown()"

        fill_in find('input[name$="[quantity]"]')[:id], with: quantity
      end

      find('.ui-autocomplete li.ui-menu-item').click
    end
end
