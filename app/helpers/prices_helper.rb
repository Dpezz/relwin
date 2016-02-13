module PricesHelper
<<<<<<< HEAD
	def set_in_taxes
	  	in_taxes = @product.in_taxes
	  	suma = 0
	  	in_taxes.each do |num|
	  		suma += num.tax.value
	  	end
	  	@intaxes = suma
	end
=======
>>>>>>> c66483081cf83138a2aa6b061be26ceefc71112f
end
