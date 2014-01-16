require 'test_helper'

class CustomersHelperTest < ActionView::TestCase
  test 'states' do
    assert_respond_to states, :each
    assert_respond_to states.first, :cities
  end
end
