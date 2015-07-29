json.array!(@in_taxes) do |in_tax|
  json.extract! in_tax, :id, :product_id, :tax_id
  json.url in_tax_url(in_tax, format: :json)
end
