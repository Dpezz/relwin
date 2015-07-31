class InUsersController < ApplicationController
	before_action :set_in_user, only: [:show, :edit, :update, :destroy]
	before_action :set_permissions, only: [:new, :create, :edit, :update]
	layout 'dashboard'

	# GET /in_users
  	# GET /in_users.json
	def index
		@in_users = current_user.users
		#@in_users = User.all
	end

	# GET /in_users/1
  	# GET /in_users/1.json
	def show
	end

	# GET /in_users/new
	def new
		@in_user = User.new
	end

	# GET /in_users/1/edit
	def edit
  	end

  	# POST /in_users
  	# POST /in_users.json
	def create
		@in_user = User.new(in_user_params)
		respond_to do |format|
  			if @in_user.save
		        format.html { redirect_to in_user_path(@in_user), notice: 'In vendor was successfully created.' }
		        format.json { render :show, status: :created, location: @in_user }
	      	else
		        format.html { render :new }
		        format.json { render json: @in_user.errors, status: :unprocessable_entity }
	      	end
	    end
	end

	# PATCH/PUT /in_users/1
  	# PATCH/PUT /in_users/1.json
	def update
	    respond_to do |format|
	      if @in_user.update(in_user_params)
	        format.html { redirect_to in_user_path(@in_user), notice: 'In user was successfully updated.' }
	        format.json { render :show, status: :ok, location: @in_user }
	      else
	        format.html { render :edit }
	        format.json { render json: @in_user.errors, status: :unprocessable_entity }
	      end
	    end
  	end

  	# DELETE /in_users/1
  	# DELETE /in_users/1.json
  	def destroy
	    @in_user.destroy
	    respond_to do |format|
	      format.html { redirect_to in_users_path, notice: 'In user was successfully destroyed.' }
	      format.json { head :no_content }
	    end
  	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_in_user
      @in_user = User.find(params[:id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_permissions
      @permissions = [['name' =>'Vendor','id' =>0]]
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def in_user_params
      params.require(:users).permit(:username, :email, :password, :password_confirmation, :permission_level).merge(user_id: current_user.id)
    end
end
