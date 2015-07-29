module ItemsHelper
	def update_price_sale
		sale = @item.sale
		suma = 0
		sale.items.each do |num|
			if num.product
				suma += num.product.price.total_p * num.unit
			end
		end
		sale.update_attributes(buy_p: suma, total_p: suma)
	end

	def update_stock_update
		stock = Stock.find_by(name: 'default')
		item = params.require(:item).permit(:unit,:product_id)
		if item['product_id'].to_i == @item.product.id
			in_stock = InStock.find_by(product_id: @item.product.id, stock_id: stock.id)
			units = in_stock.unit + @item.unit
			
			if units >= item['unit'].to_i
				in_stock.update_attributes(unit: (units - item['unit'].to_i))
			else
				redirect_to sale_items_path(@sale), :notice => "message here1"
			end
		else
			in_stock = InStock.find_by(product_id: item['product_id'], stock_id: stock.id)
			redirect_to sale_items_path(@sale), :notice => "message here2"
		end
	end

	def update_stock_create
		if @item
			stock = Stock.find_by(name: 'default')
			item = params.require(:item).permit(:unit,:product_id)
			in_stock = InStock.find_by(product_id: item['product_id'], stock_id: stock.id)
			if in_stock.unit >= item['unit'].to_i
				in_stock.update_attributes(unit: (in_stock.unit - item['unit'].to_i) )
			else
				redirect_to sale_items_path(@sale), :notice => "message here"
			end
		end
	end

	def update_stock_destroy
		stock = Stock.find_by(name: 'default')
		in_stock = InStock.find_by(product_id: @item.product.id, stock_id: stock.id)
		in_stock.update_attributes(unit: (in_stock.unit + @item.unit) )
	end
end
