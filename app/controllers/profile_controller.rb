class ProfileController < ApplicationController
	layout 'dashboard'
	
	def index
		redirect_to sales_path
	end

end
