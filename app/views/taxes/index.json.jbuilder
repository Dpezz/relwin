json.array!(@taxes) do |tax|
  json.extract! tax, :id, :product_id, :name, :cantidad, :description
  json.url tax_url(tax, format: :json)
end
