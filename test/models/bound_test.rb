require 'test_helper'

class BoundTest < ActiveSupport::TestCase
  def setup
    @bound = bounds :delivery_boy
  end

  test 'blank attributes' do
    @bound.user = nil

    assert @bound.invalid?
    assert_error @bound, :user, :blank
  end

  test 'numeric attributes' do
    @bound.duration = '12x'

    assert @bound.invalid?
    assert_error @bound, :duration, :not_a_number
  end

  test 'attributes boundaries' do
    @bound.duration = -1

    assert @bound.invalid?
    assert_error @bound, :duration, :greater_than_or_equal_to, count: 0

    @bound.duration = 2_147_483_648

    assert @bound.invalid?
    assert_error @bound, :duration, :less_than, count: 2_147_483_648
  end
end
