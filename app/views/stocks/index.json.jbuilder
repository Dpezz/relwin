json.array!(@stocks) do |stock|
  json.extract! stock, :id, :name, :address, :description, :user_id
  json.url stock_url(stock, format: :json)
end
