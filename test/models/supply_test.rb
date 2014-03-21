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
end
