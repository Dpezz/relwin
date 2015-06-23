json.array!(@providers) do |provider|
  json.extract! provider, :id, :rut, :name, :address, :phone, :url, :user_id
  json.url provider_url(provider, format: :json)
end
