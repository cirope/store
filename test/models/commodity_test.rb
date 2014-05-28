require 'test_helper'

class CommodityTest < ActiveSupport::TestCase
  def setup
    @commodity = commodities :candy
  end

  test 'blank attributes' do
    @commodity.name = ''
    @commodity.price = ''

    assert @commodity.invalid?
    assert_error @commodity, :name, :blank
    assert_error @commodity, :price, :blank
  end

  test 'attributes length' do
    @commodity.name = 'abcde' * 52

    assert @commodity.invalid?
    assert_error @commodity, :name, :too_long, count: 255
  end

  test 'attributes boundaries' do
    @commodity.price = -1

    assert @commodity.invalid?
    assert_error @commodity, :price, :greater_than_or_equal_to, count: 0

    @commodity.price = 10_000_000_000_000.00

    assert @commodity.invalid?
    assert_error @commodity, :price, :less_than, count: 9_999_999_999_999.99
  end

  test 'replace punctuation' do
    @commodity.price = '12,34'

    assert @commodity.valid?
    assert_in_delta 12.34, @commodity.price, 2 ** -20
  end

  test 'search' do
    commodities = Commodity.search query: @commodity.name

    assert commodities.present?
    assert commodities.all? { |c| c.name =~ /#{@commodity.name}/ }
  end

  test 'empty search' do
    commodities = Commodity.search query: 'empty search'

    assert commodities.empty?
  end

  test 'with receipts between' do
    start, finish = 1.day.ago, Time.zone.now
    commodities = Commodity.with_receipts_between start, finish

    assert commodities.present?
    assert commodities.all? { |c| c.created_at.between?(start, finish) }
  end

  test 'receipt sales' do
    receipt_sales = Commodity.receipt_sales

    assert_kind_of Hash, receipt_sales
    assert_equal ReceiptCommodity.sum('quantity'), receipt_sales.values.sum
  end
end
