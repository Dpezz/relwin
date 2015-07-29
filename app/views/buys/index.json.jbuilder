json.array!(@buys) do |buy|
  json.extract! buy, :id, :date, :ticket_id, :user_id
  json.url buy_url(buy, format: :json)
end
