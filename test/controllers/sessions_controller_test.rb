require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @user = users :franco
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create a new session and redirect to dashboard' do
    post :create, { email: @user.email, password: '123' }

    assert_redirected_to dashboard_url
    assert_equal @user.id, current_user.id
  end

  test 'should create a new session and redirect to launchpad' do
    @user.relations.create! organization_id: organizations(:iso).id

    post :create, { email: @user.email, password: '123' }

    assert_redirected_to launchpad_url
    assert_equal @user.id, current_user.id
  end

  test 'should not create a new session' do
    post :create, { email: @user.email, password: 'wrong' }

    assert_response :success
    assert_nil current_user
  end

  test 'should get destroy' do
    cookies.encrypted[:auth_token] = @user.auth_token

    assert_not_nil current_user

    delete :destroy

    assert_redirected_to root_url
    assert_nil current_user
  end

  private

  def current_user
    @controller.send(:current_user)
  end
end
