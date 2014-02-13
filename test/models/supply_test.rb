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
end
