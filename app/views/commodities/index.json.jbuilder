json.array!(@commodities) do |commodity|
  json.extract! commodity, :id, :name, :price
  json.unit commodity.classification.unit if commodity.classification.respond_to? :unit
end
