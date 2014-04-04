require 'test_helper'

class InvoiceCommodityTest < ActiveSupport::TestCase
  def setup
    @invoice_commodity = invoice_commodities :one_candy
  end

  test 'blank attributes' do
    @invoice_commodity.commodity = nil
    @invoice_commodity.quantity = ''
    @invoice_commodity.price = ''

    assert @invoice_commodity.invalid?
    assert_error @invoice_commodity, :commodity, :blank
    assert_error @invoice_commodity, :quantity, :blank
    assert_error @invoice_commodity, :price, :blank
  end

  test 'attributes boundaries' do
    @invoice_commodity.quantity = 0
    @invoice_commodity.price = -1

    assert @invoice_commodity.invalid?
    assert_error @invoice_commodity, :quantity, :greater_than, count: 0
    assert_error @invoice_commodity, :price, :greater_than_or_equal_to, count: 0

    @invoice_commodity.quantity = 100_000_000.00
    @invoice_commodity.price = 10_000_000_000_000.00

    assert @invoice_commodity.invalid?
    assert_error @invoice_commodity, :quantity, :less_than, count: 99_999_999.99
    assert_error @invoice_commodity, :price, :less_than, count: 9_999_999_999_999.99
  end
end
