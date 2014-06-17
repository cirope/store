require 'test_helper'

class BoundsHelperTest < ActionView::TestCase
  test 'link to uses' do
    simple_fields_for Bound.new do |f|
      assert_match /href/, link_to_uses(f)
    end
  end
end
