class PaysController < ApplicationController
  include PaysHelper
  before_action :set_payments, :set_in_terminals, only: [:new, :create, :edit, :update]
  before_action :set_sale, only: [:index, :new, :create]
  before_action :set_pay, only: [:show, :edit, :update, :destroy]
  after_action :update_active_sale, :update_total_p, only: [:create]
  layout 'dashboard'

  # GET /pays
  # GET /pays.json
  def index
    @pays = @sale.pay
  end

  # GET /pays/1
  # GET /pays/1.json
  def show
  end

  # GET /pays/new
  def new
    @pay = Pay.new
  end

  # GET /pays/1/edit
  def edit
  end

  # POST /pays
  # POST /pays.json
  def create
    @pay = Pay.new(pay_params)

    respond_to do |format|
      if @pay.save
        format.html { redirect_to sale_pay_path(@sale,@pay), notice: 'Pay was successfully created.' }
        format.json { render :show, status: :created, location: @pay }
      else
        format.html { render :new }
        format.json { render json: @pay.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pays/1
  # PATCH/PUT /pays/1.json
  def update
    respond_to do |format|
      if @pay.update(pay_params)
        format.html { redirect_to sale_pay_path(@sale,@pay), notice: 'Pay was successfully updated.' }
        format.json { render :show, status: :ok, location: @pay }
      else
        format.html { render :edit }
        format.json { render json: @pay.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pays/1
  # DELETE /pays/1.json
  def destroy
    @pay.destroy
    respond_to do |format|
      format.html { redirect_to sale_pays_path(@sale), notice: 'Pay was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:sale_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_pay
      @pay = Pay.find(params[:id])
      @sale = Sale.find(params[:sale_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_in_terminals
      terminals = current_user.terminals
      in_terminals = []
      terminals.each do |value|
        in_terminals.concat value.in_terminals.where(is_active: true)
      end
      @in_terminals = in_terminals
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_payments
      @payments = Payment.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pay_params
      params.require(:pay).permit(:payment_id, :code).merge(sale_id: params[:sale_id], in_terminal_id: $in_terminal_active.id)
    end
end
