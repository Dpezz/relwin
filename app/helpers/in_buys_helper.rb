module InBuysHelper
	def update_price_buy
		buy = @in_buy.buy
		suma = 0
		buy.in_buys.each do |num|
			if num.product
				suma += (num.product.price.buy_p * (1 + num.product.price.taxes * 0.01)) * num.unit
			end
		end
		buy.update_attributes(price: suma)
	end

	def update_in_stock
		if @in_buy.buy.ticket
			stock = Stock.find_by('name' => 'default')
			product = @in_buy.product
			in_stock = InStock.find_by( product_id: product.id, stock_id: stock.id )
			in_stock.update_attributes( unit: in_stock.unit - @valor + @in_buy.unit )
		end
	end

	def set_unit
		@valor = @in_buy.unit
	end
end
