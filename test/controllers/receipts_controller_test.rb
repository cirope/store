require 'test_helper'

class ReceiptsControllerTest < ActionController::TestCase

  setup do
    @receipt = receipts(:first_receipt)
    @book = @receipt.book

    login
  end

  test 'should get index' do
    get :index, book_id: @book
    assert_response :success
    assert_not_nil assigns(:receipts)
  end

  test 'should get new' do
    get :new, book_id: @book
    assert_response :success
  end

  test 'should create receipt' do
    assert_difference('Receipt.count') do
      post :create, book_id: @book, receipt: {
        customer_id: customers(:havanna).id
      }
    end

    assert_redirected_to receipt_url(assigns(:receipt))
  end

  test 'should show receipt' do
    get :show, id: @receipt
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @receipt
    assert_response :success
  end

  test 'should update receipt' do
    patch :update, id: @receipt, receipt: { number: 'value' }
    assert_redirected_to receipt_url(assigns(:receipt))
  end

  test 'should destroy receipt' do
    assert_difference('Receipt.count', -1) do
      delete :destroy, id: @receipt
    end

    assert_redirected_to book_receipts_path(@book)
  end
end
