require 'test_helper'

class WarehouseTest < ActiveSupport::TestCase
  def setup
    @warehouse = warehouses :cirope_hq
  end

  test 'blank attributes' do
    @warehouse.name = ''

    assert @warehouse.invalid?
    assert_error @warehouse, :name, :blank
  end

  test 'unique attributes' do
    @warehouse = @warehouse.dup

    assert @warehouse.invalid?
    assert_error @warehouse, :name, :taken
  end

  test 'attributes length' do
    @warehouse.name = 'abcde' * 52

    assert @warehouse.invalid?
    assert_error @warehouse, :name, :too_long, count: 255
  end
end
