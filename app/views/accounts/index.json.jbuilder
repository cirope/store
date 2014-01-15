json.array!(@accounts) do |account|
  json.id account.id
  json.name account.name
  json.informal account.subdomain
end
