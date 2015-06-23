json.array!(@prices) do |price|
  json.extract! price, :id, :product_id, :costo, :venta, :margen, :iva
  json.url price_url(price, format: :json)
end
