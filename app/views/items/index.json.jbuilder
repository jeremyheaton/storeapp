json.array!(@items) do |item|
  json.extract! item, :id, :product, :price, :description
  json.url item_url(item, format: :json)
end
