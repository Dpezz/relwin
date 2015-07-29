module BuysHelper
	def update_in_stock
		if @buy.ticket
			stock = Stock.find_by(name: 'default')
			@buy.in_buys.each do |value|
				product = value.product
				in_stock = InStock.find_by(product_id: product, stock_id: stock)
				in_stock.update_attributtes(unit: in_stock.unit + value.unit )
			end
		end
	end

	def update_ticket
		if @buy.ticket
			ticket = @buy.ticket
			ticket.update( is_active: true )
		elsif @ticket
			ticket = @ticket
			ticket.update_attributes( is_active: false)
		end
	end

	def set_ticket
		ticket = @buy.ticket
		if ticket
			@ticket = Ticket.find(ticket.id)
		else 
			@ticket = nil
		end
	end
end
