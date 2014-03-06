require 'test_helper'

class PurchasesHelperTest < ActionView::TestCase
  test 'purchase items' do
    @purchase = purchases :first_purchase

    assert_equal @purchase.purchase_items, purchase_items

    @purchase = Purchase.new

    assert_equal 1, purchase_items.size
    assert purchase_items.all?(&:new_record?)
  end

  test 'purchase number' do
    @purchase = Purchase.new
    @book = books :cirope_sa_p

    assert_equal @book.next_available_number, purchase_number

    @purchase = purchases :first_purchase

    assert_equal @purchase.number, purchase_number
  end

  test 'purchase date' do
    @purchase = Purchase.new

    assert_equal Date.today, purchase_date

    @purchase = purchases :first_purchase

    assert_equal @purchase.created_at.to_date, purchase_date
  end
end
