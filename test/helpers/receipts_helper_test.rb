require 'test_helper'

class ReceiptsHelperTest < ActionView::TestCase
  test 'receipt commodities' do
    @receipt = receipts :first_receipt

    assert_equal @receipt.receipt_commodities, receipt_commodities

    @receipt = Receipt.new

    assert_equal 1, receipt_commodities.size
    assert receipt_commodities.all?(&:new_record?)
  end

  test 'receipt number' do
    @receipt = Receipt.new
    @book = books :cirope_sa_x

    assert_equal @book.next_available_number, receipt_number

    @receipt = receipts :first_receipt

    assert_equal @receipt.number, receipt_number
  end

  test 'receipt date' do
    @receipt = Receipt.new

    assert_equal Date.today, receipt_date

    @receipt = receipts :first_receipt

    assert_equal @receipt.created_at.to_date, receipt_date
  end
end
