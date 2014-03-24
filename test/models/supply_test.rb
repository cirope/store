require 'test_helper'

class SupplyTest < ActiveSupport::TestCase
  def setup
    @supply = supplies :more_candy
  end

  test 'blank attributes' do
    @supply.quantity = ''
    @supply.item = nil

    assert @supply.invalid?
    assert_error @supply, :quantity, :blank
    assert_error @supply, :item, :blank
  end

  test 'active scope' do
    assert Supply.active.all? { |s| s.quantity > 0 }
  end

  test 'active quantity' do
    assert_equal Supply.active.to_a.sum(&:quantity), Supply.active_quantity
  end

  test 'active quantity in' do
    expected = Supply.from(@supply.warehouse).active.to_a.sum(&:quantity)

    assert_equal expected, Supply.active_quantity_from(@supply.warehouse)
  end

  test 'use less than quantity' do
    assert @supply.use(@supply.quantity - 1)
    assert_equal 0, @supply.remaining_from_last_use
    assert_equal 1, @supply.quantity
  end

  test 'use more than quantity' do
    assert !@supply.use(@supply.quantity + 1)
    assert_equal 1, @supply.remaining_from_last_use
    assert_equal 0, @supply.quantity
  end
end
