require 'test_helper'

class PurchaseItemTest < ActiveSupport::TestCase
  def setup
    @purchase_item = purchase_items :candy_purchase
  end

  test 'blank attributes' do
    @purchase_item.item = nil
    @purchase_item.unit = ''
    @purchase_item.quantity = ''

    assert @purchase_item.invalid?
    assert_error @purchase_item, :item, :blank
    assert_error @purchase_item, :unit, :blank
    assert_error @purchase_item, :quantity, :blank
  end

  test 'attributes boundaries' do
    @purchase_item.quantity = 0
    @purchase_item.price = -1

    assert @purchase_item.invalid?
    assert_error @purchase_item, :quantity, :greater_than, count: 0
    assert_error @purchase_item, :price, :greater_than_or_equal_to, count: 0

    @purchase_item.quantity = 100_000_000.00
    @purchase_item.price = 10_000_000_000_000.00

    assert @purchase_item.invalid?
    assert_error @purchase_item, :quantity, :less_than, count: 99_999_999.99
    assert_error @purchase_item, :price, :less_than, count: 9_999_999_999_999.99
  end
end
