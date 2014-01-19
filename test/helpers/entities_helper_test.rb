require 'test_helper'

class EntitiesHelperTest < ActionView::TestCase
  test 'tax conditions' do
    conditions = tax_conditions

    assert_kind_of Array, conditions
    assert_equal Entity::TAX_CONDITIONS.size, conditions.size
  end
end
