module InvoicesHelper
  def invoice_commodities
    @invoice.invoice_commodities.new if @invoice.invoice_commodities.empty?

    @invoice.invoice_commodities
  end

  def invoice_number
    @invoice.persisted? ? @invoice.number : @book.next_available_number
  end

  def invoice_date invoice = @invoice
    invoice.persisted? ? invoice.created_at.to_date : Date.today
  end
end
