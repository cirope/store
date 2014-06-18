class InvoicesController < ApplicationController
  respond_to :html, :json

  before_action :authorize
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  before_action :set_title, except: [:destroy]

  include BookScoped

  # GET /invoices
  def index
    @invoices = invoices.ordered.page params[:page]
  end

  # GET /invoices/1
  def show
  end

  # GET /invoices/new
  def new
    @invoice = @book.invoices.new customer_id: params[:customer_id]
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  def create
    @invoice = @book.invoices.new invoice_params

    @invoice.save
    respond_with @invoice
  end

  # PUT/PATCH /invoices/1
  def update
    update_resource @invoice, invoice_params
    respond_with @invoice
  end

  # DELETE /invoices/1
  def destroy
    @invoice.destroy
    respond_with @invoice, location: book_invoices_url(@book)
  end

  private

    def set_invoice
      @invoice = @resource = Invoice.find params[:id]
    end

    def invoices
      customer ? @book.invoices.by_customer(customer) : @book.invoices
    end

    def customer
      @customer ||= Customer.find params[:customer_id] if params[:customer_id]
    end

    def invoice_params
      params.require(:invoice).permit :customer_id, :issued_at, :lock_version,
        invoice_commodities_attributes: [
          :id, :commodity_id, :quantity, :price, :_destroy
      ]
    end
end
