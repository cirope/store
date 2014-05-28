require 'test_helper'

class ServicesControllerTest < ActionController::TestCase
  setup do
    @service = services :delivery

    login
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:services)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should get new as js' do
    xhr :get, :new
    assert_response :success
    assert_template layout: nil
  end

  test 'should create service' do
    assert_difference('Service.count') do
      post :create, service: {
        commodity_attributes: {
          name: 'Delivery',
          price: '0,30'
        }
      }
    end

    assert_redirected_to service_url(assigns(:service))
  end

  test 'should create service via js' do
    assert_difference('Service.count') do
      xhr :post, :create, service: {
        commodity_attributes: {
          name: 'Delivery',
          price: '0,30'
        }
      }
    end

    assert_response :success
    assert_template 'services/create'
  end

  test 'should show service' do
    get :show, id: @service
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @service
    assert_response :success
  end

  test 'should update service' do
    patch :update, id: @service, service: {
      commodity_attributes: { id: @service.commodity.id, name: 'Updated' }
    }
    assert_redirected_to service_url(assigns(:service))
  end

  test 'should destroy service' do
    @service.commodity.receipt_commodities.clear
    @service.commodity.invoice_commodities.clear

    assert_difference('Service.count', -1) do
      delete :destroy, id: @service
    end

    assert_redirected_to services_path
  end
end
