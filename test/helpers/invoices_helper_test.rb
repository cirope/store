require 'test_helper'

class InvoicesHelperTest < ActionView::TestCase
  test 'invoice commodities' do
    @invoice = invoices :first_sale

    assert_equal @invoice.invoice_commodities, invoice_commodities

    @invoice = Invoice.new

    assert_equal 1, invoice_commodities.size
    assert invoice_commodities.all?(&:new_record?)
  end

  test 'invoice number' do
    @invoice = Invoice.new
    @book = books :cirope_sa_x

    assert_equal @book.next_available_number, invoice_number

    @invoice = invoices :first_sale

    assert_equal @invoice.number, invoice_number
  end

  test 'invoice date' do
    @invoice = Invoice.new

    assert_equal Date.today, invoice_date

    @invoice = invoices :first_sale

    assert_equal @invoice.created_at.to_date, invoice_date
  end
end
