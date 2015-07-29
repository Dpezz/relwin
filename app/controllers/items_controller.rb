class ItemsController < ApplicationController
  include ItemsHelper
  before_action :set_products, only: [:index, :new, :create, :edit, :update]
  before_action :set_sale, only: [:index, :new, :create]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  after_action :update_price_sale, only: [:create, :update, :destroy]
  before_action :update_stock_create, only: [:create]
  before_action :update_stock_update, only: [:update]
  after_action :update_stock_destroy, only: [:destroy]
  layout 'dashboard'
  
  # GET /items
  # GET /items.json
  def index
    @items = @sale.items
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to sale_item_path(@sale,@item), notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to sale_item_path(@sale,@item), notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to sale_items_path(@sale), notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:sale_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @sale = Sale.find(params[:sale_id])
      @item = Item.find(params[:id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_products
      @products = current_user.products
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:product_id, :unit).merge(sale_id: params[:sale_id])
    end
end
