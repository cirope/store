require 'test_helper'

class ReceiptItemTest < ActiveSupport::TestCase
  def setup
    @receipt_item = receipt_items :one_candy
  end

  test 'blank attributes' do
    @receipt_item.item = nil
    @receipt_item.quantity = ''

    assert @receipt_item.invalid?
    assert_error @receipt_item, :item, :blank
    assert_error @receipt_item, :quantity, :blank
  end

  test 'attributes boundaries' do
    @receipt_item.quantity = 0

    assert @receipt_item.invalid?
    assert_error @receipt_item, :quantity, :greater_than, count: 0
  end
end
