require 'test_helper'

class CustomersHelperTest < ActionView::TestCase
  test 'add customer link' do
    assert_match /#{I18n.t('customers.new.customer')}/, add_customer_link
  end

  test 'customer voucher link' do
    book = books :cirope_sa_x
    customer = customers :havanna

    assert_match /href/, customer_vouchers_link(book, customer)
  end

  test 'customer date picker options' do
    assert_kind_of Hash, customer_date_picker_options
  end

  test 'customer time ago to last receipt' do
    customer = customers :havanna
    last_receipt_date = customer.last_receipt_date

    assert_match time_ago_in_words(last_receipt_date), customer_time_ago_to_last_receipt(customer)
    assert_equal t('customers.receipts.zero'), customer_time_ago_to_last_receipt(Customer.new)
  end
end
