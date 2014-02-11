class ReceiptsController < ApplicationController
  respond_to :html, :json

  before_action :authorize
  before_action :set_receipt, only: [:show, :edit, :update, :destroy]
  before_action :set_book
  before_action :set_title, except: [:destroy]

  # GET /receipts
  def index
    @receipts = @book.receipts

    respond_with @book, @receipts
  end

  # GET /receipts/1
  def show
    respond_with @receipt
  end

  # GET /receipts/new
  def new
    @receipt = @book.receipts.new
    respond_with @book, @receipt
  end

  # GET /receipts/1/edit
  def edit
  end

  # POST /receipts
  def create
    @receipt = @book.receipts.new receipt_params

    @receipt.save
    respond_with @receipt
  end

  # PUT/PATCH /receipts/1
  def update
    @receipt.update receipt_params
    respond_with @receipt
  end

  # DELETE /receipts/1
  def destroy
    @receipt.destroy
    respond_with @receipt, location: book_receipts_url(@book)
  end

  private

    def set_receipt
      @receipt = Receipt.find params[:id]
    end

    def set_book
      @book = @receipt ? @receipt.book : Book.find(params[:book_id])
    end

    def receipt_params
      params.require(:receipt).permit :customer_id, :lock_version,
        receipt_items_attributes: [:id, :item_id, :quantity, :_destroy]
    end
end
