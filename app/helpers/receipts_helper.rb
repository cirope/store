module ReceiptsHelper
  def receipt_items
    @receipt.receipt_items.new if @receipt.receipt_items.empty?

    @receipt.receipt_items
  end

  def receipt_number
    @receipt.persisted? ? @receipt.number : @book.next_available_number
  end
end
