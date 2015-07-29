json.array!(@in_stocks) do |in_stock|
  json.extract! in_stock, :id, :stock_id, :product_id, :unit
  json.url in_stock_url(in_stock, format: :json)
end
