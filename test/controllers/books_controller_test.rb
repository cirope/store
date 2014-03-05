require 'test_helper'

class BooksControllerTest < ActionController::TestCase

  setup do
    @book = books :cirope_sa_a
    @organization = @book.organization

    login
  end

  test 'should get index' do
    get :index, organization_id: @organization
    assert_response :success
    assert_not_nil assigns(:books)
  end

  test 'should get new income action' do
    get :new, organization_id: @organization, flow: 'income'
    assert_response :success
  end

  test 'should get new outcome action' do
    get :new, organization_id: @organization, flow: 'outcome'
    assert_response :success
  end

  test 'should create book' do
    assert_difference('Book.count') do
      post :create, organization_id: @organization, book: {
        kind: 'A',
        last_used_number: '123'
      }
    end

    assert_redirected_to launchpad_url
  end

  test 'should show book' do
    get :show, id: @book
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @book
    assert_response :success
  end

  test 'should update book' do
    patch :update, id: @book, book: { kind: 'B' }
    assert_redirected_to launchpad_url
  end

  test 'should destroy book' do
    assert_difference('Book.count', -1) do
      delete :destroy, id: @book
    end

    assert_redirected_to launchpad_url
  end
end
