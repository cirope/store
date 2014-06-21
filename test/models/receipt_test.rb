require 'test_helper'

class ReceiptTest < ActiveSupport::TestCase
  def setup
    @receipt = receipts :first_receipt
  end

  test 'blank attributes' do
    @receipt.number = ''
    @receipt.customer = nil
    @receipt.issued_at = nil

    assert @receipt.invalid?
    assert_error @receipt, :number, :blank
    assert_error @receipt, :customer, :blank
    assert_error @receipt, :issued_at, :blank
  end

  test 'unique attributes' do
    receipt = @receipt.dup
    @receipt.book.update! last_used_number: @receipt.number - 1

    assert receipt.invalid?
    assert_error receipt, :number, :taken
  end

  test 'date validations' do
    @receipt.issued_at = '13/13/13'

    assert @receipt.invalid?
    assert_error @receipt, :issued_at, :invalid_date
  end

  test 'assign number after validate' do
    receipt = @receipt.dup
    receipt.number = nil

    assert receipt.valid?
    assert_not_nil receipt.number
  end

  test 'customer has email' do
    assert @receipt.customer_has_email?

    @receipt.customer.email = ''

    assert !@receipt.customer_has_email?
  end

  test 'total' do
    total = @receipt.receipt_commodities.to_a.sum { |rc| rc.price * rc.quantity }

    assert_equal total, @receipt.total
  end

  test 'by customer' do
    customer = @receipt.customer

    assert Receipt.by_customer(customer).all? { |i| i.customer == customer }
  end
end
