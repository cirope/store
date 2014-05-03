json.array!(@services) do |service|
  json.extract! service, :id, :name, :price
end
