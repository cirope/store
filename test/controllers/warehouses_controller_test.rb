require 'test_helper'

class WarehousesControllerTest < ActionController::TestCase
  setup do
    @warehouse = warehouses :cirope_hq

    login
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:warehouses)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create warehouse' do
    assert_difference('Warehouse.count') do
      post :create, warehouse: { name: 'Alternative warehouse' }
    end

    assert_redirected_to warehouse_url(assigns(:warehouse))
  end

  test 'should show warehouse' do
    get :show, id: @warehouse
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @warehouse
    assert_response :success
  end

  test 'should update warehouse' do
    patch :update, id: @warehouse, warehouse: { name: 'New name' }
    assert_redirected_to warehouse_url(assigns(:warehouse))
  end

  test 'should destroy warehouse' do
    assert_difference('Warehouse.count', -1) do
      delete :destroy, id: @warehouse
    end

    assert_redirected_to warehouses_url
  end
end
