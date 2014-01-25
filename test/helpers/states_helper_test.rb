require 'test_helper'

class StatesHelperTest < ActionView::TestCase
  test 'states' do
    assert_respond_to states, :each
  end

  test 'states and cities' do
    states = states_and_cities

    assert_respond_to states, :each
    assert_respond_to states.first, :cities
  end
end
