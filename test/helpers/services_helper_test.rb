require 'test_helper'

class ServicesHelperTest < ActionView::TestCase
  test 'service commodity' do
    @service = Service.new

    assert_kind_of Commodity, service_commodity
  end
end
