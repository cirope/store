require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  def setup
    @item = items :candy
  end

  test 'blank attributes' do
    @item.code = ''
    @item.unit = ''

    assert @item.invalid?
    assert_error @item, :code, :blank
    assert_error @item, :unit, :blank
  end

  test 'unique attributes' do
    item = @item.dup
    item.commodity = @item.commodity

    assert item.invalid?
    assert_error item, :code, :taken
  end
end
