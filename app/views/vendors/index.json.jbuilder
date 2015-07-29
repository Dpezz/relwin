json.array!(@vendors) do |vendor|
  json.extract! vendor, :id, :rut, :name, :plastname, :mlastname, :terminal_id, :user_id
  json.url vendor_url(vendor, format: :json)
end
