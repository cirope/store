require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  setup do
    @customer = customers :havanna
  end

  test 'validate birth' do
    @customer.birth = '13/13/13'

    assert @customer.invalid?
    assert_error @customer, :birth, :invalid_date
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

  test 'cancel destruction' do
    assert_no_difference 'Customer.count' do
      @customer.destroy
    end

    @customer.receipts.clear
    @customer.invoices.clear

    assert_difference 'Customer.count', -1 do
      @customer.destroy
    end
  end

  test 'last receipt date' do
    assert_equal @customer.receipts.ordered.last.issued_at, @customer.last_receipt_date
  end
end
