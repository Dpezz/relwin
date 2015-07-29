module OrdersHelper
	def update_ticket
		if @order.ticket
			ticket = @order.ticket
			ticket.update( is_active: true )
		elsif @ticket
			ticket = @ticket
			ticket.update_attributes( is_active: false)
		end
	end

	def set_ticket
		ticket = @order.ticket
		if ticket
			@ticket = Ticket.find(ticket.id)
		else 
			@ticket = nil
		end
	end
end
