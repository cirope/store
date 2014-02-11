class InvoicesController < ApplicationController
  respond_to :html, :json

  before_action :authorize
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  before_action :set_book
  before_action :set_title, except: [:destroy]

  # GET /invoices
  def index
    @invoices = @book.invoices

    respond_with @invoices
  end

  # GET /invoices/1
  def show
    respond_with @invoice
  end

  # GET /invoices/new
  def new
    @invoice = @book.invoices.new
    respond_with @invoice
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
    @invoice.update invoice_params
    respond_with @invoice
  end

  # DELETE /invoices/1
  def destroy
    @invoice.destroy
    respond_with @invoice, location: book_invoices_url(@book)
  end

  private

    def set_invoice
      @invoice = Invoice.find params[:id]
    end

    def set_book
      @book = @invoice ? @invoice.book : Book.find(params[:book_id])
    end

    def invoice_params
      params.require(:invoice).permit :customer_id, :lock_version,
        invoice_items_attributes: [:id, :item_id, :quantity, :price, :_destroy]
    end
end
