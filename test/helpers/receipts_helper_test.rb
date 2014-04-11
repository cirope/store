require 'test_helper'

class ReceiptsHelperTest < ActionView::TestCase
  test 'receipt items' do
    @receipt = receipts :first_receipt

    assert_equal @receipt.receipt_items, receipt_items

    @receipt = Receipt.new

    assert_equal 1, receipt_items.size
    assert receipt_items.all?(&:new_record?)
  end

  test 'receipt number' do
    @receipt = Receipt.new
    @book = books :cirope_sa_x

    assert_equal @book.next_available_number, receipt_number

    @receipt = receipts :first_receipt

    assert_equal @receipt.number, receipt_number
  end
end
