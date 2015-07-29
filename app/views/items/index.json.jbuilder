json.array!(@items) do |item|
  json.extract! item, :id, :product_id, :sale_id, :unit
  json.url item_url(item, format: :json)
end
