require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  def setup
    @item = items :candy
  end

  test 'blank attributes' do
    @item.code = ''
    @item.name = ''

    assert @item.invalid?
    assert_error @item, :code, :blank
    assert_error @item, :name, :blank
  end

  test 'unique attributes' do
    item = @item.dup

    assert item.invalid?
    assert_error item, :code, :taken
  end

  test 'attributes length' do
    @item.code = 'abcde' * 52
    @item.name = 'abcde' * 52

    assert @item.invalid?
    assert_error @item, :code, :too_long, count: 255
    assert_error @item, :name, :too_long, count: 255
  end
end
