module ProductsHelper
<<<<<<< HEAD
    def set_create_intax
        tax = Tax.find_by(name: 'iva')
        in_tax = InTax.new(product_id: @product.id, tax_id: tax.id)
        in_tax.save
    end

    def set_create_price
        tax = Tax.find_by(name: 'iva')
        price = Price.new(product_id: @product.id, buy_p: 0, sale_p: 0, total_p: 0, taxes: tax.value, return: 0)
        price.save
    end

    def set_create_instock
        stock = Stock.find_by(name: 'default')
        in_stock = InStock.new(product_id: @product.id, stock_id: stock.id, unit: 0, limit: 0)
        in_stock.save
    end
=======
>>>>>>> c66483081cf83138a2aa6b061be26ceefc71112f
end
