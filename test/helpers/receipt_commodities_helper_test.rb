require 'test_helper'

class ReceiptCommoditiesHelperTest < ActionView::TestCase
  test 'receipt commodity bounds' do
    simple_fields_for ReceiptCommodity.new do |f|
      bounds = receipt_commodity_bounds f

      assert_equal 1, bounds.size
      assert bounds.all?(&:new_record?)
    end

    simple_fields_for receipt_commodities(:one_delivery) do |f|
      bounds = receipt_commodity_bounds f

      assert_equal 1, bounds.size
      assert bounds.all?(&:persisted?)
    end
  end

  test 'link to bounds' do
    simple_fields_for ReceiptCommodity.new do |f|
      assert_match /href/, link_to_bounds(f)
    end
  end
end
