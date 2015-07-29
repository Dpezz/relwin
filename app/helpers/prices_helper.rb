module PricesHelper
	def set_in_taxes
	  	in_taxes = @product.in_taxes
	  	suma = 0
	  	in_taxes.each do |num|
	  		suma += num.tax.value
	  	end
	  	@intaxes = suma
	end
end
