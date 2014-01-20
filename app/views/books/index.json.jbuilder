json.array!(@books) do |book|
  json.extract! book, :id, :kind, :last_used_number, :organization_id, :account_id
  json.url organization_book_url(book, format: :json)
end
