json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :number, :customer_id, :organization_id, :account_id
  json.url organization_invoice_url(@organization, invoice, format: :json)
end
