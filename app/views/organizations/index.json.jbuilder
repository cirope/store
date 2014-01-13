json.array!(@organizations) do |organization|
  json.id organization.id
  json.name organization.name
  json.informal organization.subdomain
end
