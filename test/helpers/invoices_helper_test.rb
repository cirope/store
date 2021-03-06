require 'test_helper'

class InvoicesHelperTest < ActionView::TestCase
  include LinksHelper

  test 'invoice commodities' do
    @invoice = invoices :first_sale

    assert_equal @invoice.invoice_commodities, invoice_commodities

    @invoice = Invoice.new

    assert_equal 1, invoice_commodities.size
    assert invoice_commodities.all?(&:new_record?)
  end

  test 'invoice number' do
    @invoice = Invoice.new
    @book = books :cirope_sa_a

    assert_equal @book.next_available_number, invoice_number

    @invoice = invoices :first_sale

    assert_equal @invoice.number, invoice_number
  end

  test 'new invoice link' do
    @virtual_path = 'invoices.index'
    @book = books :cirope_sa_a

    assert_match new_book_invoice_path(@book), new_invoice_link
  end
end
