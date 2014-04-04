module ReceiptsHelper
  def receipt_commodities
    @receipt.receipt_commodities.new if @receipt.receipt_commodities.empty?

    @receipt.receipt_commodities
  end

  def receipt_number
    @receipt.persisted? ? @receipt.number : @book.next_available_number
  end

  def receipt_date receipt = @receipt
    receipt.persisted? ? receipt.created_at.to_date : Date.today
  end
end
