module InvoicesHelper
  def invoice_items
    @invoice.invoice_items.new if @invoice.invoice_items.empty?

    @invoice.invoice_items
  end

  def invoice_number
    @invoice.persisted? ? @invoice.number : @book.next_available_number
  end

  def invoice_date
    @invoice.persisted? ? @invoice.created_at.to_date : Date.today
  end
end
