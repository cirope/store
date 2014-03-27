require 'test_helper'

class LaunchpadHelperTest < ActionView::TestCase
  test 'new ticket path' do
    book = books :cirope_sa_a

    assert_equal new_book_invoice_path(book), new_ticket_path(book)

    book = books :cirope_sa_x

    assert_equal new_book_receipt_path(book), new_ticket_path(book)
  end

  test 'new ticket label' do
    book = books :cirope_sa_a

    assert_match Invoice.model_name.human, new_ticket_label(book)
  end

  test 'add book link' do
    link = add_book_link organization: organizations(:cirope_sa), flow: 'income'

    assert_match /#{I18n.t('organizations.new.income_book')}/, link
  end
end
