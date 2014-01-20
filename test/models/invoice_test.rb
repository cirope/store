require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  def setup
    @invoice = invoices :first_sale
  end

  test 'blank attributes' do
    @invoice.number = ''

    assert @invoice.invalid?
    assert_error @invoice, :number, :blank
  end

  test 'unique attributes' do
    invoice = @invoice.dup
    @invoice.book.update! last_used_number: @invoice.number - 1

    assert invoice.invalid?
    assert_error invoice, :number, :taken
  end

  test 'assign number after validate' do
    invoice = @invoice.dup
    invoice.number = nil

    assert invoice.valid?
    assert_not_nil invoice.number
  end
end
