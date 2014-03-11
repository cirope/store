require 'test_helper'

class ItemsHelperTest < ActionView::TestCase
  test 'add item link' do
    assert_match /#{I18n.t('items.new.item')}/, add_item_link
  end
end
