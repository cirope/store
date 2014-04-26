require 'test_helper'

class InvoicesHelperTest < ActionView::TestCase
  test 'invoice items' do
    @invoice = invoices :first_sale

    assert_equal @invoice.invoice_items, invoice_items

    @invoice = Invoice.new

    assert_equal 1, invoice_items.size
    assert invoice_items.all?(&:new_record?)
  end

  test 'invoice number' do
    @invoice = Invoice.new
    @book = books :cirope_sa_x

    assert_equal @book.next_available_number, invoice_number

    @invoice = invoices :first_sale

    assert_equal @invoice.number, invoice_number
  end

  test 'new invoice link' do
    skip
  end
end
