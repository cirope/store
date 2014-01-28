class CustomersController < ApplicationController
  include Responder

  before_action :authorize
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :set_title, only: [:index, :show, :new, :edit]

  # GET /customers
  def index
    @customers = Customer.search query: params[:q], limit: request.xhr?
  end

  # GET /customers/1
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  def create
    @title = t 'customers.new.title'
    @customer = Customer.new customer_params

    create_and_respond
  end

  # PUT/PATCH /customers/1
  def update
    @title = t 'customers.edit.title'

    update_and_respond
  end

  # DELETE /customers/1
  def destroy
    destroy_and_respond
  end

  private

  def set_customer
    @customer = Customer.find params[:id]
  end

  def set_title
    @title = t '.title'
  end

  def customer_params
    params.require(:customer).permit :lock_version,
      entity_attributes: [:id, :tax_id, :tax_condition, :name, :address, :city_id]
  end
  alias_method :resource_params, :customer_params

  def resource
    @customer
  end
  alias_method :after_create_url, :resource
  alias_method :after_update_url, :resource

  def edit_resource_url
    edit_customer_url @customer
  end

  alias_method :after_destroy_url, :customers_url
end
