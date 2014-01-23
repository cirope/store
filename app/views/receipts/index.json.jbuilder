json.array!(@receipts) do |receipt|
  json.extract! receipt, :id, :number, :customer_id, :book_id, :account_id, :lock_version
  json.url receipt_url(receipt, format: :json)
end
