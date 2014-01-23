module ReceiptsHelper
  def receipt_items
    @receipt.receipt_items.new if @receipt.receipt_items.empty?

    @receipt.receipt_items
  end
end
