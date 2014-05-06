require 'test_helper'

class BoundTest < ActiveSupport::TestCase
  def setup
    @bound = bounds :delivery_boy
  end

  test 'blank attributes' do
    @bound.user = nil
    @bound.notes = ''

    assert @bound.invalid?
    assert_error @bound, :base, :blank
  end

  test 'time attributes' do
    @bound.start = 'xx'
    @bound.finish = '16:30x'

    assert @bound.invalid?
    assert_error @bound, :start, :invalid_time
    assert_error @bound, :finish, :invalid_time
  end

  test 'nil times' do
    @bound.start = @bound.finish = '00:00'

    @bound.save!

    assert_nil @bound.start
    assert_nil @bound.finish
  end
end
