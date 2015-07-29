module PaysHelper
	def update_active_sale
		sale = @pay.sale
		sale.update_attributes(is_active: true)
	end

	def update_total_p
		if @pay.in_terminal.is_active
			suma = @pay.in_terminal.total_p + @pay.sale.buy_p
			@pay.in_terminal.update_attributes(total_p: suma)
		end
	end
end
