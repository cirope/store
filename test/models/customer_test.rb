require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  setup do
    @customer = customers :havanna
  end

  test 'search' do
    customers = Customer.search query: @customer.name

    assert customers.present?
    assert customers.all? { |o| o.name =~ /#{@customer.name}/ }
  end

  test 'empty search' do
    customers = Customer.search query: 'empty search'

    assert customers.empty?
  end
end
