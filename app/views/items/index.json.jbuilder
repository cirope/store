json.array!(@items) do |item|
  json.extract! item, :id, :code, :name, :account_id
  json.url item_url(item, format: :json)
end
