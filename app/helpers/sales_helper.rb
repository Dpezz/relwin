module SalesHelper
	def set_sale_price
		sales = current_user.sales
		suma = 0
	  	sales.each do |num|
	  		if num.buy_p
	  			suma += num.buy_p
	  		end
	  	end
	  	@sale_total_p = suma
	end

	def update_stock
		stock = Stock.find_by(name: 'default')
		@sale.items.each do |value|
			in_stock = InStock.find_by(product_id: value.product.id, stock_id: stock.id)
			in_stock.update_attributes(unit: (in_stock.unit + value.unit) )
		end
	end
end
