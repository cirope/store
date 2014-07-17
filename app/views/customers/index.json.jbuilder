json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :email
  json.informal [customer.tax_id, customer.email].reject(&:blank?).join ' | '
  json.distance_time_to_last_receipt customer_time_ago_to_last_receipt(customer)
end
