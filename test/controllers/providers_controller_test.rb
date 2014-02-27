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

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create provider' do
    assert_difference('Provider.count') do
      post :create, provider: { entity_attributes: generic_entity_attributes }
    end

    assert_redirected_to provider_url(assigns(:provider))
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

    assert_redirected_to providers_path
  end
end