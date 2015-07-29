module InVendorsHelper
	def update_total_p
		if !@in_vendor.is_active
			suma = 0
			@in_vendor.sales.each do |value|
				suma += value.buy_p
			end
			@in_vendor.update_attributes(total_p: suma )
		end
	end
end
