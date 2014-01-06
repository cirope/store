json.array!(@organizations) do |organization|
  json.extract! organization, :id, :name, :subdomain
  json.url organization_url(organization, format: :json)
end
