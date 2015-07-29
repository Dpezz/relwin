class InStocksController < ApplicationController
  before_action :set_stocks, only: [:new, :create, :edit, :update]
  before_action :set_product, only: [:index, :new, :create]
  before_action :set_in_stock, only: [:show, :edit, :update, :destroy]
  layout 'dashboard'

  # GET /in_stocks
  # GET /in_stocks.json
  def index
    @in_stocks = @product.in_stocks
  end

  # GET /in_stocks/1
  # GET /in_stocks/1.json
  def show
  end

  # GET /in_stocks/new
  def new
    @in_stock = InStock.new
  end

  # GET /in_stocks/1/edit
  def edit
  end

  # POST /in_stocks
  # POST /in_stocks.json
  def create
    @in_stock = InStock.new(in_stock_params)

    respond_to do |format|
      if @in_stock.save
        format.html { redirect_to product_in_stock_path(@product,@in_stock), notice: 'In stock was successfully created.' }
        format.json { render :show, status: :created, location: @in_stock }
      else
        format.html { render :new }
        format.json { render json: @in_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /in_stocks/1
  # PATCH/PUT /in_stocks/1.json
  def update
    respond_to do |format|
      if @in_stock.update(in_stock_params)
        format.html { redirect_to product_in_stock_path(@product,@in_stock), notice: 'In stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @in_stock }
      else
        format.html { render :edit }
        format.json { render json: @in_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /in_stocks/1
  # DELETE /in_stocks/1.json
  def destroy
    @in_stock.destroy
    respond_to do |format|
      format.html { redirect_to product_in_stocks_path(@product), notice: 'In stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:product_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_in_stock
      @product = Product.find(params[:product_id])
      @in_stock = InStock.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_stocks
      @stocks = current_user.stocks.where('is_active' => true)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def in_stock_params
      params.require(:in_stock).permit(:stock_id, :unit, :limit).merge(product_id: params[:product_id])
    end
end
