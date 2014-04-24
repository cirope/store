module ReceiptsHelper

  def receipt_items
    @receipt.receipt_items.new if @receipt.receipt_items.empty?

    @receipt.receipt_items
  end

  def receipt_number
    @receipt.persisted? ? @receipt.number : @book.next_available_number
  end

  def new_receipt_link options = {}
    link_to_new new_book_receipt_path(@book, customer_id: params[:customer_id]), options
  end
end
