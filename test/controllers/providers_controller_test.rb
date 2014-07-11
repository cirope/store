require 'test_helper'

class ProvidersControllerTest < ActionController::TestCase
  include EntitiesTestHelper

  setup do
    @provider = providers :arcor

    login
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:providers)
  end

  test 'should filtered index' do
    xhr :get, :index, q: @provider.name, format: :json
    assert_response :success

    providers = JSON.parse(@response.body)
    assert_equal 1, providers.size
    assert_equal @provider.name, providers.first['name']
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

  test 'should create provider' do
    assert_difference('Provider.count') do
      post :create, provider: { entity_attributes: generic_entity_attributes }
    end

    assert_redirected_to provider_url(assigns(:provider))
  end

  test 'should create provider via js' do
    assert_difference('Provider.count') do
      xhr :post, :create, provider: { entity_attributes: generic_entity_attributes }
    end

    assert_response :success
    assert_template 'providers/create'
  end

  test 'should show provider' do
    get :show, id: @provider
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @provider
    assert_response :success
  end

  test 'should update provider' do
    patch :update, id: @provider, provider: {
      entity_attributes: { id: @provider.entity.id, name: 'Updated' }
    }
    assert_redirected_to provider_url(assigns(:provider))
  end

  test 'should destroy provider' do
    assert_difference('Provider.count', -1) do
      delete :destroy, id: @provider
    end

    assert_redirected_to providers_url
  end
end
