require 'test_helper'

class ReceiptCommodityTest < ActiveSupport::TestCase
  def setup
    @receipt_commodity = receipt_commodities :one_candy
  end

  test 'blank attributes' do
    @receipt_commodity.commodity = nil
    @receipt_commodity.quantity = ''

    assert @receipt_commodity.invalid?
    assert_error @receipt_commodity, :commodity, :blank
    assert_error @receipt_commodity, :quantity, :blank
  end

  test 'attributes boundaries' do
    @receipt_commodity.quantity = 0

    assert @receipt_commodity.invalid?
    assert_error @receipt_commodity, :quantity, :greater_than, count: 0

    @receipt_commodity.quantity = 100_000_000.00

    assert @receipt_commodity.invalid?
    assert_error @receipt_commodity, :quantity, :less_than, count: 99_999_999.99
  end
end
