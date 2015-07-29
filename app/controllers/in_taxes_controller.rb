class InTaxesController < ApplicationController
  include InTaxesHelper
  before_action :set_taxes, only: [:new, :create, :edit, :update]
  before_action :set_product, only: [:index, :new, :create]
  before_action :set_in_tax, only: [:show, :edit, :update, :destroy]
  after_action :update_price, only: [:create, :update, :destroy]
  layout 'dashboard'

  # GET /in_taxes
  # GET /in_taxes.json
  def index
    @in_taxes= @product.in_taxes
  end

  # GET /in_taxes/1
  # GET /in_taxes/1.json
  def show
  end

  # GET /in_taxes/new
  def new
    @in_tax = InTax.new
  end

  # GET /in_taxes/1/edit
  def edit
  end

  # POST /in_taxes
  # POST /in_taxes.json
  def create
    @in_tax = InTax.new(in_tax_params)

    respond_to do |format|
      if @in_tax.save
        format.html { redirect_to product_in_tax_path(@product,@in_tax), notice: 'In tax was successfully created.' }
        format.json { render :show, status: :created, location: @in_tax }
      else
        format.html { render :new }
        format.json { render json: @in_tax.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /in_taxes/1
  # PATCH/PUT /in_taxes/1.json
  def update
    respond_to do |format|
      if @in_tax.update(in_tax_params)
        format.html { redirect_to product_in_tax_path(@product,@in_tax), notice: 'In tax was successfully updated.' }
        format.json { render :show, status: :ok, location: @in_tax }
      else
        format.html { render :edit }
        format.json { render json: @in_tax.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /in_taxes/1
  # DELETE /in_taxes/1.json
  def destroy
    @in_tax.destroy
    respond_to do |format|
      format.html { redirect_to product_in_taxes_url(@product), notice: 'In tax was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:product_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_in_tax
      @product = Product.find(params[:product_id])
      @in_tax = InTax.find(params[:id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_taxes
      @taxes = Tax.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def in_tax_params
      params.require(:in_tax).permit(:tax_id).merge(product_id: params[:product_id])
    end
end
