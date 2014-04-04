require 'test_helper'

class PurchaseCommodityTest < ActiveSupport::TestCase
  def setup
    @purchase_commodity = purchase_commodities :candy_purchase
  end

  test 'blank attributes' do
    @purchase_commodity.commodity = nil
    @purchase_commodity.unit = ''
    @purchase_commodity.quantity = ''

    assert @purchase_commodity.invalid?
    assert_error @purchase_commodity, :commodity, :blank
    assert_error @purchase_commodity, :unit, :blank
    assert_error @purchase_commodity, :quantity, :blank
  end

  test 'attributes boundaries' do
    @purchase_commodity.quantity = 0
    @purchase_commodity.price = -1

    assert @purchase_commodity.invalid?
    assert_error @purchase_commodity, :quantity, :greater_than, count: 0
    assert_error @purchase_commodity, :price, :greater_than_or_equal_to, count: 0

    @purchase_commodity.quantity = 100_000_000.00
    @purchase_commodity.price = 10_000_000_000_000.00

    assert @purchase_commodity.invalid?
    assert_error @purchase_commodity, :quantity, :less_than, count: 99_999_999.99
    assert_error @purchase_commodity, :price, :less_than, count: 9_999_999_999_999.99
  end
end
