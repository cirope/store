require 'test_helper'

class ItemsHelperTest < ActionView::TestCase
  test 'item commodity' do
    @item = Item.new

    assert_kind_of Commodity, item_commodity
  end
end
