require 'test_helper'

class SlimInputTest < ActionView::TestCase
  test 'input' do
    simple_fields_for(InvoiceCommodity.new) do |f|
      input = f.input :price, as: :slim

      assert_match /placeholder/, input
      assert_no_match /label/, input
    end
  end
end
