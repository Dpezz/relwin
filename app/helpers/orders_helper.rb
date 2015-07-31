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

	def set_code
		a = (0...9).sort_by{rand}[1..5]
		# => [19, 22, 28]
		string = ''
		a.each do |value|
			string = string + value.to_s
		end
		@code = 'o-'+ string
	end
end
