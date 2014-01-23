class ReceiptsController < ApplicationController
  include Responder

  before_action :authorize
  before_action :set_receipt, only: [:show, :edit, :update, :destroy]
  before_action :set_book
  before_action :set_title, only: [:index, :show, :new, :edit]

  # GET /receipts
  def index
    @receipts = @book.receipts
  end

  # GET /receipts/1
  def show
  end

  # GET /receipts/new
  def new
    @receipt = @book.receipts.new
  end

  # GET /receipts/1/edit
  def edit
  end

  # POST /receipts
  def create
    @title = t 'receipts.new.title'
    @receipt = @book.receipts.new receipt_params

    create_and_respond
  end

  # PUT/PATCH /receipts/1
  def update
    @title = t 'receipts.edit.title'

    update_and_respond
  end

  # DELETE /receipts/1
  def destroy
    destroy_and_respond
  end

  private

  def set_receipt
    @receipt = Receipt.find params[:id]
  end

  def set_book
    @book = @receipt ? @receipt.book : Book.find(params[:book_id])
  end

  def set_title
    @title = t '.title'
  end

  def receipt_params
    params.require(:receipt).permit :customer_id, :lock_version
  end
  alias_method :resource_params, :receipt_params

  def resource
    @receipt
  end
  alias_method :after_create_url, :resource
  alias_method :after_update_url, :resource

  def edit_resource_url
    edit_receipt_url @receipt
  end

  def after_destroy_url
    book_receipts_url @book
  end
end
