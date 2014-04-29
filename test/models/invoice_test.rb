require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  def setup
    @invoice = invoices :first_sale
  end

  test 'blank attributes' do
    @invoice.number = ''
    @invoice.customer = nil
    @invoice.issued_at = nil

    assert @invoice.invalid?
    assert_error @invoice, :number, :blank
    assert_error @invoice, :customer, :blank
    assert_error @invoice, :issued_at, :blank
  end

  test 'unique attributes' do
    invoice = @invoice.dup
    @invoice.book.update! last_used_number: @invoice.number - 1

    assert invoice.invalid?
    assert_error invoice, :number, :taken
  end

  test 'date validations' do
    @invoice.issued_at = '13/13/13'

    assert @invoice.invalid?
    assert_error @invoice, :issued_at, :invalid_date
  end

  test 'issued in sequence' do
    invoice = @invoice.dup
    invoice.issued_at -= 1.day

    assert invoice.invalid?
    assert_error invoice, :issued_at, :invalid
  end

  test 'assign number after validate' do
    invoice = @invoice.dup
    invoice.number = nil

    assert invoice.valid?
    assert_not_nil invoice.number
  end

  test 'by customer' do
    customer = @invoice.customer

    assert Invoice.by_customer(customer).all? { |i| i.customer == customer }
  end
end
