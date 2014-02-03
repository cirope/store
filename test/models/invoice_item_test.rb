require 'test_helper'

class InvoiceItemTest < ActiveSupport::TestCase
  def setup
    @invoice_item = invoice_items :one_candy
  end

  test 'blank attributes' do
    @invoice_item.item = nil
    @invoice_item.quantity = ''
    @invoice_item.price = ''

    assert @invoice_item.invalid?
    assert_error @invoice_item, :item, :blank
    assert_error @invoice_item, :quantity, :blank
    assert_error @invoice_item, :price, :blank
  end

  test 'attributes boundaries' do
    @invoice_item.quantity = 0
    @invoice_item.price = -1

    assert @invoice_item.invalid?
    assert_error @invoice_item, :quantity, :greater_than, count: 0
    assert_error @invoice_item, :price, :greater_than_or_equal_to, count: 0

    @invoice_item.quantity = 100_000_000.00
    @invoice_item.price = 10_000_000_000_000.00

    assert @invoice_item.invalid?
    assert_error @invoice_item, :quantity, :less_than, count: 99_999_999.99
    assert_error @invoice_item, :price, :less_than, count: 9_999_999_999_999.99
  end
end
