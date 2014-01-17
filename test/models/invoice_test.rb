require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  def setup
    @invoice = invoices(:first_sale)
  end

  test 'blank attributes' do
    @invoice.number = ''

    assert @invoice.invalid?
    assert_error @invoice, :number, :blank
  end

  test 'unique attributes' do
    @invoice = Invoice.new @invoice.dup.attributes

    assert @invoice.invalid?
    assert_error @invoice, :number, :taken
  end
end
