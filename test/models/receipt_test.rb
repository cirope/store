require 'test_helper'

class ReceiptTest < ActiveSupport::TestCase
  def setup
    @receipt = receipts :first_receipt
  end

  test 'blank attributes' do
    @receipt.number = ''
    @receipt.customer = nil

    assert @receipt.invalid?
    assert_error @receipt, :number, :blank
    assert_error @receipt, :customer, :blank
  end

  test 'unique attributes' do
    receipt = @receipt.dup
    @receipt.book.update! last_used_number: @receipt.number - 1

    assert receipt.invalid?
    assert_error receipt, :number, :taken
  end

  test 'assign number after validate' do
    receipt = @receipt.dup
    receipt.number = nil

    assert receipt.valid?
    assert_not_nil receipt.number
  end
end
