json.array!(@pays) do |pay|
  json.extract! pay, :id, :sale_id, :terminal_id, :method, :code
  json.url pay_url(pay, format: :json)
end
