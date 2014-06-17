require 'test_helper'

class ReceiptCommoditiesHelperTest < ActionView::TestCase
  test 'link to bounds' do
    simple_fields_for ReceiptCommodity.new do |f|
      assert_match /href/, link_to_bounds(f)
    end
  end
end
