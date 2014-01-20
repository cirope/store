json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :number, :customer_id, :book_id, :account_id
  json.url invoice_url(invoice, format: :json)
end
