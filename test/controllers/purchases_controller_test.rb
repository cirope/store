require 'test_helper'

class PurchasesControllerTest < ActionController::TestCase

  setup do
    @purchase = purchases :first_purchase
    @book = @purchase.book

    login
  end

  test 'should get index' do
    get :index, book_id: @book
    assert_response :success
    assert_not_nil assigns(:purchases)
  end

  test 'should get new' do
    get :new, book_id: @book
    assert_response :success
  end

  test 'should create purchase' do
    commodity = commodities :candy

    assert_difference ['Purchase.count', 'PurchaseCommodity.count'] do
      post :create, book_id: @book, purchase: {
        provider_id: @purchase.provider_id,
        requested_at: I18n.l(Time.zone.today),
        purchase_commodities_attributes: [
          {
            commodity_id: commodity.id,
            unit: commodity.classification.unit,
            quantity: '5',
            price: (commodity.price * 0.8).to_s
          }
        ]
      }
    end

    assert_redirected_to purchase_url(assigns(:purchase))
  end

  test 'should show purchase' do
    get :show, id: @purchase
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @purchase
    assert_response :success
  end

  test 'should update purchase' do
    patch :update, id: @purchase, purchase: { requested_at: I18n.l(1.day.ago.to_date) }
    assert_redirected_to purchase_url(assigns(:purchase))
  end

  test 'should destroy purchase' do
    assert_difference('Purchase.count', -1) do
      delete :destroy, id: @purchase
    end

    assert_redirected_to book_purchases_url(@book)
  end
end
