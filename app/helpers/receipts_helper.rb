module ReceiptsHelper
  def receipt_commodities
    @receipt.receipt_commodities.new if @receipt.receipt_commodities.empty?

    @receipt.receipt_commodities
  end

  def receipt_number
    @receipt.persisted? ? @receipt.number : @book.next_available_number
  end

  def new_receipt_link options = {}
    link_to_new new_book_receipt_path(@book, customer_id: params[:customer_id]), options
  end
end
