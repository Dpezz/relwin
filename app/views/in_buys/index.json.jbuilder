json.array!(@in_buys) do |in_buy|
  json.extract! in_buy, :id, :buy_id, :product_id, :unit
  json.url in_buy_url(in_buy, format: :json)
end
