module ReceiptsHelper
  def receipt_commodities
    @receipt.receipt_commodities.new if @receipt.receipt_commodities.empty?

    @receipt.receipt_commodities
  end

  def receipt_number
    @receipt.persisted? ? @receipt.number : @book.next_available_number
  end
end
