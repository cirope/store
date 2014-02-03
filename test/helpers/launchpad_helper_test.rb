require 'test_helper'

class LaunchpadHelperTest < ActionView::TestCase
  test 'new ticket path' do
    book = books :cirope_sa_a

    assert_equal new_book_invoice_path(book), new_ticket_path(book)

    book = books :cirope_sa_x

    assert_equal new_book_receipt_path(book), new_ticket_path(book)
  end
end
