json.array!(@customers) do |customer|
  json.extract! customer, :id, :name
  json.informal customer.tax_id
end
