require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  def setup
    @customer = customers :havanna
  end

  test 'blank attributes' do
    @customer.tax_id = ''
    @customer.name = ''

    assert @customer.invalid?
    assert_error @customer, :tax_id, :blank
    assert_error @customer, :name, :blank
  end

  test 'unique attributes' do
    customer = Customer.new @customer.dup.attributes

    assert customer.invalid?
    assert_error customer, :tax_id, :taken
    assert_error customer, :name, :taken
  end

  test 'attributes length' do
    @customer.tax_id = 'abcde' * 52
    @customer.name = 'abcde' * 52

    assert @customer.invalid?
    assert_error @customer, :tax_id, :too_long, count: 255
    assert_error @customer, :name, :too_long, count: 255
  end
end
