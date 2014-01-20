class InvoicesController < ApplicationController
  include Responder

  before_action :authorize
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  before_action :set_book
  before_action :set_title, only: [:index, :show, :new, :edit]

  # GET /invoices
  def index
    @invoices = @book.invoices
  end

  # GET /invoices/1
  def show
  end

  # GET /invoices/new
  def new
    @invoice = @book.invoices.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  def create
    @title = t 'invoices.new.title'
    @invoice = @book.invoices.new invoice_params

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

  def set_invoice
    @invoice = Invoice.find params[:id]
  end

  def set_book
    @book = @invoice ? @invoice.book : Book.find(params[:book_id])
  end

  def set_title
    @title = t '.title'
  end

  def invoice_params
    params.require(:invoice).permit :customer_id, :lock_version
  end
  alias_method :resource_params, :invoice_params

  def resource
    @invoice
  end
  alias_method :after_create_url, :resource
  alias_method :after_update_url, :resource

  def edit_resource_url
    edit_invoice_url @invoice
  end

  def after_destroy_url
    book_invoices_url @book
  end
end
