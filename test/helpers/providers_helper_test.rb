require 'test_helper'

class ProvidersHelperTest < ActionView::TestCase
  test 'add provider link' do
    assert_match /#{I18n.t('providers.new.provider')}/, add_provider_link
  end
end
