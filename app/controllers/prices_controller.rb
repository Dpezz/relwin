class PricesController < ApplicationController
  before_action :set_product, only: [:new, :create]
  before_action :set_price, only: [:show, :edit, :update, :destroy]
  layout 'dashboard'
  
  # GET /prices
  # GET /prices.json
  def index
    @prices = Price.all
  end

  # GET /prices/1
  # GET /prices/1.json
  def show
  end

  # GET /prices/new
  def new
    @price = Price.new
  end

  # GET /prices/1/edit
  def edit
  end

  # POST /prices
  # POST /prices.json
  def create
    @price = Price.new(price_params)
    respond_to do |format|
      if @price.save
        format.html { redirect_to product_price_path(@product,@price), notice: 'Price was successfully created.' }
        format.json { render :show, status: :created, location: @price }
      else
        format.html { render :new }
        format.json { render json: @price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prices/1
  # PATCH/PUT /prices/1.json
  def update
    respond_to do |format|
      if @price.update(price_params)
        format.html { redirect_to product_price_path(@product,@price), notice: 'Price was successfully updated.' }
        format.json { render :show, status: :ok, location: @price }
      else
        format.html { render :edit }
        format.json { render json: @price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prices/1
  # DELETE /prices/1.json
  def destroy
    @price.destroy
    respond_to do |format|
      format.html { redirect_to product_prices_path(@product), notice: 'Price was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:product_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_price
      @product = Product.find(params[:product_id])
      @price = Price.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def price_params
      id_product = Product.find(params[:product_id])
      params.require(:price).permit(:costo, :venta, :margen, :iva).merge(product_id: id_product.id)
    end
end
