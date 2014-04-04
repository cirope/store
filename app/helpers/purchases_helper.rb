module PurchasesHelper
  def purchase_commodities
    @purchase.purchase_commodities.new if @purchase.purchase_commodities.empty?

    @purchase.purchase_commodities
  end

  def purchase_number
    @purchase.persisted? ? @purchase.number : @book.next_available_number
  end

  def purchase_date purchase = @purchase
    purchase.persisted? ? purchase.created_at.to_date : Date.today
  end
end
