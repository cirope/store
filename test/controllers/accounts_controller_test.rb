require 'test_helper'

class AccountsControllerTest < ActionController::TestCase

  setup do
    @account = accounts(:cirope)

    login
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:accounts)
  end

  test 'should filtered index' do
    xhr :get, :index, q: @account.name, format: :json
    assert_response :success

    accounts = JSON.parse(@response.body)
    assert_equal 1, accounts.size
    assert_equal @account.name, accounts.first['name']
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create account' do
    assert_difference('Account.count') do
      post :create, account: {
        name: 'IRAM',
        subdomain: 'iram'
      }
    end

    assert_redirected_to account_url(assigns(:account))
  end

  test 'should show account' do
    get :show, id: @account
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @account
    assert_response :success
  end

  test 'should update account' do
    patch :update, id: @account, account: { name: 'New name' }
    assert_redirected_to account_url(assigns(:account))
  end

  test 'should destroy account' do
    assert_difference('Account.count', -1) do
      delete :destroy, id: @account
    end

    assert_redirected_to accounts_path
  end
end
