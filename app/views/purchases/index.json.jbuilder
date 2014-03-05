json.array!(@purchases) do |purchase|
  json.extract! purchase, :id, :number, :provider_id, :account_id
  json.url purchase_url(purchase, format: :json)
end
