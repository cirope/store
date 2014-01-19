require 'test_helper'

class OrganizationsControllerTest < ActionController::TestCase
  include EntitiesTestHelper

  setup do
    @organization = organizations :cirope_sa

    login
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:organizations)
  end

  test 'should filtered index' do
    xhr :get, :index, q: @organization.name, format: :json
    assert_response :success

    organizations = JSON.parse(@response.body)
    assert_equal 1, organizations.size
    assert_equal @organization.name, organizations.first['name']
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create organization' do
    assert_difference('Organization.count') do
      post :create, organization: { entity_attributes: generic_entity_attributes }
    end

    assert_redirected_to organization_url(assigns(:organization))
  end

  test 'should show organization' do
    get :show, id: @organization
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @organization
    assert_response :success
  end

  test 'should update organization' do
    patch :update, id: @organization, organization: {
      entity_attributes: { id: @organization.entity.id, name: 'Updated' }
    }
    assert_redirected_to organization_url(assigns(:organization))
  end

  test 'should destroy organization' do
    assert_difference('Organization.count', -1) do
      delete :destroy, id: @organization
    end

    assert_redirected_to organizations_path
  end
end
