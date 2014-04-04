require 'test_helper'

class CommoditiesControllerTest < ActionController::TestCase

  setup do
    @commodity = commodities :candy

    login
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:commodities)
  end

  test 'should filtered index' do
    xhr :get, :index, q: @commodity.name, format: :json
    assert_response :success

    commodities = JSON.parse(@response.body)
    assert_equal 1, commodities.size
    assert_equal @commodity.name, commodities.first['name']
  end
end
