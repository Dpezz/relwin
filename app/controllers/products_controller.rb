class ProductsController < ApplicationController
<<<<<<< HEAD
  include ProductsHelper
  before_action :set_providers, :set_categorys, :set_measures, only: [:new, :create, :edit, :update]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  after_action  :set_create_intax, :set_create_instock, :set_create_price, only: [:create]
=======
  before_action :set_product, only: [:show, :edit, :update, :destroy]
>>>>>>> c66483081cf83138a2aa6b061be26ceefc71112f
  layout 'dashboard'

  # GET /products
  # GET /products.json
  def index
<<<<<<< HEAD
    @products = current_user.products
=======
    @products = Product.all
>>>>>>> c66483081cf83138a2aa6b061be26ceefc71112f
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end
<<<<<<< HEAD
    # Use callbacks to share common setup or constraints between actions.
    def set_providers
      @providers = current_user.providers
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_categorys
      @categorys = current_user.categories
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_measures
      @measures = Measure.all
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:code, :barcode, :name, :measure_id, :provider_id, :category_id).merge(user_id: current_user.id)
=======

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:code, :barcode, :name, :stock, :provider_id, :category_id).merge(user_id: current_user.id)
>>>>>>> c66483081cf83138a2aa6b061be26ceefc71112f
    end
end
