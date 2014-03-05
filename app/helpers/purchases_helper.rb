module PurchasesHelper
  def purchase_number
    @purchase.persisted? ? @purchase.number : @book.next_available_number
  end

  def purchase_date
    @purchase.persisted? ? @purchase.created_at.to_date : Date.today
  end
end
