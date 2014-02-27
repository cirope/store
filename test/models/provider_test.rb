require 'test_helper'

class ProviderTest < ActiveSupport::TestCase
  def setup
    @provider = providers :arcor
  end

  test 'search' do
    providers = Provider.search query: @provider.name

    assert providers.present?
    assert providers.all? { |o| o.name =~ /#{@provider.name}/ }
  end

  test 'empty search' do
    providers = Provider.search query: 'empty search'

    assert providers.empty?
  end
end
