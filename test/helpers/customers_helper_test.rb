require 'test_helper'

class CustomersHelperTest < ActionView::TestCase
  test 'add customer link' do
    assert_match /#{I18n.t('customers.new.customer')}/, add_customer_link
  end
end
