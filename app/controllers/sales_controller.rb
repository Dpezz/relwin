class SalesController < ApplicationController
  include SalesHelper
  before_action :set_vendors, :set_clients, only: [:new, :edit]
  before_action :set_sale, only: [:show, :edit, :update, :destroy]
  before_action :set_sale_price, only: [:index]
  before_action :update_stock, only: [:destroy]
  layout 'dashboard'
  
  # GET /sales
  # GET /sales.json
  def index
    @sales = current_user.sales
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new(is_active: false, in_vendor_id: $in_vendor_active.id, user_id: current_user.id)
    respond_to do |format|
      if @sale.save
        format.html { redirect_to sale_items_path(@sale), notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_vendors
      @in_vendors = current_user.in_vendors
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_clients
      @clients = current_user.clients
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:desc, :total_p, :buy_p, :client_id, :is_active, :in_vendor_id).merge(user_id: current_user.id)
    end
end
