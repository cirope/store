json.array!(@customers) do |customer|
  json.extract! customer, :id, :tax_id, :name, :address, :city_id, :account_id
  json.url customer_url(customer, format: :json)
end
