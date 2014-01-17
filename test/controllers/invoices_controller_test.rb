require 'test_helper'

class InvoicesControllerTest < ActionController::TestCase

  setup do
    @invoice = invoices(:first_sale)
    @organization = @invoice.organization

    login
  end

  test 'should get index' do
    get :index, organization_id: @organization
    assert_response :success
    assert_not_nil assigns(:invoices)
  end

  test 'should get new' do
    get :new, organization_id: @organization
    assert_response :success
  end

  test 'should create invoice' do
    assert_difference('Invoice.count') do
      post :create, organization_id: @organization, invoice: {
        number: '2',
        customer_id: customers(:havanna).id
      }
    end

    assert_redirected_to organization_invoice_url(@organization, assigns(:invoice))
  end

  test 'should show invoice' do
    get :show, organization_id: @organization, id: @invoice
    assert_response :success
  end

  test 'should get edit' do
    get :edit, organization_id: @organization, id: @invoice
    assert_response :success
  end

  test 'should update invoice' do
    patch :update, organization_id: @organization, id: @invoice, invoice: {
      number: '2'
    }
    assert_redirected_to organization_invoice_url(@organization, assigns(:invoice))
  end

  test 'should destroy invoice' do
    assert_difference('Invoice.count', -1) do
      delete :destroy, organization_id: @organization, id: @invoice
    end

    assert_redirected_to organization_invoices_path(@organization)
  end
end
