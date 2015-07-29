class InBuysController < ApplicationController
  include InBuysHelper
  before_action :set_products, only: [:new, :create, :edit, :update]
  before_action :set_buy, only: [:index, :new, :create]
  before_action :set_in_buy, only: [:show, :edit, :update, :destroy]
  after_action :update_price_buy, only: [:create, :update, :destroy]
  after_action :update_in_stock, only: [:update]
  before_action :set_unit, only: [:update]
  layout 'dashboard'
  
  # GET /in_buys
  # GET /in_buys.json
  def index
    @in_buys = @buy.in_buys
  end

  # GET /in_buys/1
  # GET /in_buys/1.json
  def show
  end

  # GET /in_buys/new
  def new
    @in_buy = InBuy.new
  end

  # GET /in_buys/1/edit
  def edit
  end

  # POST /in_buys
  # POST /in_buys.json
  def create
    @in_buy = InBuy.new(in_buy_params)

    respond_to do |format|
      if @in_buy.save
        format.html { redirect_to buy_in_buy_path(@buy,@in_buy), notice: 'In buy was successfully created.' }
        format.json { render :show, status: :created, location: @in_buy }
      else
        format.html { render :new }
        format.json { render json: @in_buy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /in_buys/1
  # PATCH/PUT /in_buys/1.json
  def update
    respond_to do |format|
      if @in_buy.update(in_buy_params)
        format.html { redirect_to buy_in_buy_path(@buy,@in_buy), notice: 'In buy was successfully updated.' }
        format.json { render :show, status: :ok, location: @in_buy }
      else
        format.html { render :edit }
        format.json { render json: @in_buy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /in_buys/1
  # DELETE /in_buys/1.json
  def destroy
    @in_buy.destroy
    respond_to do |format|
      format.html { redirect_to buy_in_buys_path(@buy), notice: 'In buy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buy
      @buy = Buy.find(params[:buy_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_in_buy
      @buy = Buy.find(params[:buy_id])
      @in_buy = InBuy.find(params[:id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_products
      @products = current_user.products
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def in_buy_params
      params.require(:in_buy).permit(:product_id, :unit).merge(buy_id: params[:buy_id])
    end
end
