json.array!(@items) do |item|
  json.extract! item, :id, :name, :unit, :price
end
