module PurchasesHelper
  def purchase_items
    @purchase.purchase_items.new if @purchase.purchase_items.empty?

    @purchase.purchase_items
  end

  def purchase_number
    @purchase.persisted? ? @purchase.number : @book.next_available_number
  end

  def purchase_date
    @purchase.persisted? ? @purchase.created_at.to_date : Date.today
  end
end
