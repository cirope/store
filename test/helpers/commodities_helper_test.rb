require 'test_helper'

class CommoditiesHelperTest < ActionView::TestCase
  test 'add commodity link' do
    assert_match /#{I18n.t('commodities.new.commodity')}/, add_commodity_link
  end
end
