require 'test_helper'

class ServiceTest < ActiveSupport::TestCase
  def setup
    @service = services :delivery
  end

  test 'numeric attributes' do
    @service.duration = '12x'

    assert @service.invalid?
    assert_error @service, :duration, :not_a_number
  end

  test 'attributes boundaries' do
    @service.duration = -1

    assert @service.invalid?
    assert_error @service, :duration, :greater_than_or_equal_to, count: 0

    @service.duration = 2_147_483_648

    assert @service.invalid?
    assert_error @service, :duration, :less_than, count: 2_147_483_648
  end
end
