require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:john)

    login
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test 'should get account index' do
    with_account

    get :index
    assert_response :success
    assert_not_nil assigns(:users)
    assert assigns(:users).all? { |u| u.accounts.include?(@account) }
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create user' do
    assert_difference 'User.count' do
      post :create, user: {
        name: @user.name,
        lastname: @user.lastname,
        email: 'new@user.com',
        password: '123',
        password_confirmation: '123'
      }
    end

    assert_redirected_to user_url(assigns(:user))
  end

  test 'should create user in current account' do
    with_account

    assert_difference '@account.users.count' do
      post :create, user: {
        name: @user.name,
        lastname: @user.lastname,
        email: 'new@user.com',
        password: '123',
        password_confirmation: '123'
      }
    end

    assert_redirected_to user_url(assigns(:user))
  end

  test 'should show user' do
    get :show, id: @user
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @user
    assert_response :success
  end

  test 'should update user' do
    patch :update, id: @user, user: { name: 'Updated name' }
    assert_redirected_to user_url(assigns(:user))
  end

  test 'should destroy user' do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_url
  end

  private

    def with_account
      @account = accounts :cirope
      @request.host = "#{@account.subdomain}.lvh.me"
    end
end
