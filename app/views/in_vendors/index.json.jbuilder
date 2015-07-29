json.array!(@in_vendors) do |in_vendor|
  json.extract! in_vendor, :id, :vendor_id, :start_date, :end_date, :is_active, :user_id
  json.url in_vendor_url(in_vendor, format: :json)
end
