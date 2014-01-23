require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  def setup
    @item = items :candy
  end

  test 'blank attributes' do
    @item.code = ''
    @item.name = ''
    @item.unit = ''
    @item.price = ''

    assert @item.invalid?
    assert_error @item, :code, :blank
    assert_error @item, :name, :blank
    assert_error @item, :unit, :blank
    assert_error @item, :price, :blank
  end

  test 'unique attributes' do
    item = @item.dup

    assert item.invalid?
    assert_error item, :code, :taken
  end

  test 'attributes length' do
    @item.code = 'abcde' * 52
    @item.name = 'abcde' * 52
    @item.unit = 'abcde' * 52

    assert @item.invalid?
    assert_error @item, :code, :too_long, count: 255
    assert_error @item, :name, :too_long, count: 255
    assert_error @item, :unit, :too_long, count: 255
  end

  test 'attributes boundaries' do
    @item.price = -1

    assert @item.invalid?
    assert_error @item, :price, :greater_than_or_equal_to, count: 0

    @item.price = 10_000_000_000_000.00

    assert @item.invalid?
    assert_error @item, :price, :less_than, count: 9_999_999_999_999.99
  end

  test 'replace punctuation' do
    @item.price = '12,34'

    assert @item.valid?
    assert_in_delta 12.34, @item.price, 2 ** -20
  end
end
