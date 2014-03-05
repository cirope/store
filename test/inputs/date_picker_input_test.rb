require 'test_helper'

class DatePickerInputTest < ActionView::TestCase
  test 'input' do
    simple_fields_for(Purchase.new) do |f|
      input = f.input :requested_at, as: :date_picker

      assert_match /data-date-picker/, input
    end
  end
end
