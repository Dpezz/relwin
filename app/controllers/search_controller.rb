class SearchController < ApplicationController
	layout 'dashboard'

	def index
		data = params[:search]
		if !data.empty?
			@find_providers = current_user.providers.where("name LIKE ?", "%#{data}%")
			@find_products = current_user.products.where("name LIKE ? or code LIKE ? or barcode LIKE ?" , "%#{data}%", "%#{data}%", "%#{data}%")
			@find_vendors = current_user.vendors.where("name LIKE :prefix", prefix: "#{data}%")
			@find_terminals = current_user.terminals.where("name LIKE :prefix", prefix: "#{data}%")
		end
		@data = data
	end
end
