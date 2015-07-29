module InTerminalsHelper
	def set_total_price
		if !@in_terminal.is_active
			suma = 0
			@in_terminal.pays.each do |value|
				suma += value.sale.buy_p
			end
			@in_terminal.update_attributes(end_p: suma - @in_terminal.start_p)
		end
	end
end
