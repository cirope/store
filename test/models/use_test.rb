require 'test_helper'

class UseTest < ActiveSupport::TestCase
  def setup
    @use = uses :chocolate_present
  end

  test 'blank attributes' do
    @use.item = nil
    @use.quantity = ''

    assert @use.invalid?
    assert_error @use, :item, :blank
    assert_error @use, :quantity, :blank
  end

  test 'attributes boundaries' do
    @use.quantity = 0

    assert @use.invalid?
    assert_error @use, :quantity, :greater_than, count: 0

    @use.quantity = 100_000_000.00

    assert @use.invalid?
    assert_error @use, :quantity, :less_than, count: 99_999_999.99
  end
end
