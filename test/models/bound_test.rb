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
end
