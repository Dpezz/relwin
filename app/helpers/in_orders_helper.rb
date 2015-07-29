module InOrdersHelper
	def update_price_order
		order = @in_order.order
		suma = 0
		order.in_orders.each do |num|
			if num.product
				suma += (num.product.price.buy_p * (1 + num.product.price.taxes * 0.01)) * num.unit_o
			end
		end
		order.update_attributes(price: suma)
	end

	def update_in_stock
		if @in_order.order.ticket
			stock = Stock.find_by('name' => 'default')
			product = @in_order.product
			in_stock = InStock.find_by( product_id: product.id, stock_id: stock.id )
			in_stock.update_attributes( unit: (in_stock.unit -  @valor) + @in_order.unit_r)
		end
	end

	def set_unit_r
		@valor = @in_order.unit_r
	end
end
