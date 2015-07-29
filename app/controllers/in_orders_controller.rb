class InOrdersController < ApplicationController
  include InOrdersHelper
  before_action :set_products, only: [:new, :create, :edit, :update]
  before_action :set_order, only: [:index, :new, :create]
  before_action :set_in_order, only: [:show, :edit, :update, :destroy]
  after_action :update_price_order, only: [:create, :update, :destroy]
  after_action :update_in_stock, only: [:update]
  before_action :set_unit_r, only: [:update]
  layout 'dashboard'

  # GET /in_orders
  # GET /in_orders.json
  def index
    @in_orders = @order.in_orders
  end

  # GET /in_orders/1
  # GET /in_orders/1.json
  def show
  end

  # GET /in_orders/new
  def new
    @in_order = InOrder.new
  end

  # GET /in_orders/1/edit
  def edit
  end

  # POST /in_orders
  # POST /in_orders.json
  def create
    @in_order = InOrder.new(in_order_params)

    respond_to do |format|
      if @in_order.save
        format.html { redirect_to order_in_order_path(@order,@in_order), notice: 'In order was successfully created.' }
        format.json { render :show, status: :created, location: @in_order }
      else
        format.html { render :new }
        format.json { render json: @in_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /in_orders/1
  # PATCH/PUT /in_orders/1.json
  def update
    respond_to do |format|
      if @in_order.update(in_order_params)
        format.html { redirect_to order_in_order_path(@order,@in_order), notice: 'In order was successfully updated.' }
        format.json { render :show, status: :ok, location: @in_order }
      else
        format.html { render :edit }
        format.json { render json: @in_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /in_orders/1
  # DELETE /in_orders/1.json
  def destroy
    @in_order.destroy
    respond_to do |format|
      format.html { redirect_to order_in_orders_path(@order), notice: 'In order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:order_id])
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_in_order
      @order = Order.find(params[:order_id])
      @in_order = InOrder.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_products
      @products = current_user.products
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def in_order_params
      params.require(:in_order).permit(:product_id, :unit_o, :unit_r, :sales_check).merge(order_id: params[:order_id])
    end
end
