module InTaxesHelper
  def update_price
    price = @product.price 
    suma = 0
    price.product.in_taxes.each do |num|
      suma += num.tax.value
    end
    now_price = price.buy_p * (1 + price.return * 0.01)
    new_price = now_price + price.buy_p * (suma * 0.01)
    price.update_attributes(total_p: new_price, taxes: suma)
  end
end
