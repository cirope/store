class InvoicesController < ApplicationController
  include Responder

  before_action :authorize
  before_action :set_organization
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  before_action :set_title, only: [:index, :show, :new, :edit]

  # GET /invoices
  def index
    @invoices = @organization.invoices
  end

  # GET /invoices/1
  def show
  end

  # GET /invoices/new
  def new
    @invoice = @organization.invoices.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  def create
    @title = t 'invoices.new.title'
    @invoice = @organization.invoices.new invoice_params

    create_and_respond
  end

  # PUT/PATCH /invoices/1
  def update
    @title = t 'invoices.edit.title'

    update_and_respond
  end

  # DELETE /invoices/1
  def destroy
    destroy_and_respond
  end

  private

  def set_organization
    @organization = Organization.find params[:organization_id]
  end

  def set_invoice
    @invoice = @organization.invoices.find params[:id]
  end

  def set_title
    @title = t '.title'
  end

  def invoice_params
    params.require(:invoice).permit :number, :customer_id, :lock_version
  end
  alias_method :resource_params, :invoice_params

  def resource
    @invoice
  end

  def organization_invoice
    [@organization, @invoice]
  end
  alias_method :after_create_url, :organization_invoice
  alias_method :after_update_url, :organization_invoice

  def edit_resource_url
    edit_organization_invoice_url @organization, @invoice
  end

  def after_destroy_url
    organization_invoices_url @organization
  end
end
