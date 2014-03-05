json.array!(@providers) do |provider|
  json.extract! provider, :id, :name
  json.informal provider.tax_id
end
