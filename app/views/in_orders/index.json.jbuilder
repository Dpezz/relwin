json.array!(@in_orders) do |in_order|
  json.extract! in_order, :id, :order_id, :product_id, :unit_o, :unit_r, :sales_check
  json.url in_order_url(in_order, format: :json)
end
