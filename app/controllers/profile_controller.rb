class ProfileController < ApplicationController
	before_action :set_user, only: [:account, :password, :update_account, :update_password]
	layout 'dashboard'
	
	def index
		redirect_to sales_path
	end

	def account
	end

	def password
	end

	def update_account
		respond_to do |format|
	      if @user.update(user_params)
	        format.html { redirect_to account_path(@user), notice: 'User was successfully updated.' }
	        format.json { render :account, status: :ok, location: @user }
	      else
	        format.html { render :account }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
	    end
	end

		def update_password
		respond_to do |format|
	      if @user.update(password_params)
	        format.html { redirect_to password_path(@user), notice: 'User was successfully updated.' }
	        format.json { render :account, status: :ok, location: @user }
	      else
	        format.html { render :password }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
	    end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:users).permit(:username, :email)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def password_params
      params.require(:users).permit(:password, :password_confirmation)
    end
end
