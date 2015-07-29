json.array!(@products) do |product|
  json.extract! product, :id, :code, :barcode, :name, :stock, :provider_id, :category_id, :user_id
  json.url product_url(product, format: :json)
end
