class TaxesController < ApplicationController
  before_action :set_product, only: [:index, :new, :create]
  before_action :set_tax, only: [:show, :edit, :update, :destroy]
  layout 'dashboard'

  # GET /taxes
  # GET /taxes.json
  def index
    @taxes = Tax.all
  end

  # GET /taxes/1
  # GET /taxes/1.json
  def show
  end

  # GET /taxes/new
  def new
    @tax = Tax.new
  end

  # GET /taxes/1/edit
  def edit
  end

  # POST /taxes
  # POST /taxes.json
  def create
    @tax = Tax.new(tax_params)

    respond_to do |format|
      if @tax.save
        format.html { redirect_to product_tax_path(@product,@tax), notice: 'Tax was successfully created.' }
        format.json { render :show, status: :created, location: @tax }
      else
        format.html { render :new }
        format.json { render json: @tax.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /taxes/1
  # PATCH/PUT /taxes/1.json
  def update
    respond_to do |format|
      if @tax.update(tax_params)
        format.html { redirect_to product_tax_path(@product,@tax), notice: 'Tax was successfully updated.' }
        format.json { render :show, status: :ok, location: @tax }
      else
        format.html { render :edit }
        format.json { render json: @tax.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taxes/1
  # DELETE /taxes/1.json
  def destroy
    @tax.destroy
    respond_to do |format|
      format.html { redirect_to product_taxes_url(@product), notice: 'Tax was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:product_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_tax
      @product = Product.find(params[:product_id])
      @tax = Tax.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tax_params
      id_product = Product.find(params[:product_id])
      params.require(:tax).permit(:name, :cantidad, :description).merge(product_id: id_product.id)
    end
end
