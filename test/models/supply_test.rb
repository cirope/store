require 'test_helper'

class SupplyTest < ActiveSupport::TestCase
  def setup
    @supply = supplies :more_candy
  end

  test 'blank attributes' do
    @supply.quantity = ''
    @supply.commodity = nil

    assert @supply.invalid?
    assert_error @supply, :quantity, :blank
    assert_error @supply, :commodity, :blank
  end
end
