json.array!(@in_terminals) do |in_terminal|
  json.extract! in_terminal, :id, :terminal_id, :vendor_id, :start_p, :total_p, :end_p, :start_date, :end_date, :active, :user_id
  json.url in_terminal_url(in_terminal, format: :json)
end
