json.array!(@measures) do |measure|
  json.extract! measure, :id, :name, :symbol, :description
  json.url measure_url(measure, format: :json)
end
