json.array!(@terminals) do |terminal|
  json.extract! terminal, :id, :name, :description, :user_id
  json.url terminal_url(terminal, format: :json)
end
