require 'test_helper'

class LaunchpadControllerTest < ActionController::TestCase
  setup do
    login
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:organizations)
  end
end
