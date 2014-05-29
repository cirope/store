require 'test_helper'

class Reports::CommoditiesHelperTest < ActionView::TestCase
  test 'voucher option for' do
    assert_match /<li>/, voucher_option_for('receipt')
  end

  private

    def request
      ActionDispatch::TestRequest.new
    end
end
