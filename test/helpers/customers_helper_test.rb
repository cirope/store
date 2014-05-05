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
end
