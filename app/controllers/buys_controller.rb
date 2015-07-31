class BuysController < ApplicationController
  include BuysHelper
  before_action :set_tickets, only: [:new, :create, :edit, :update]
  before_action :set_buy, only: [:show, :edit, :update, :destroy]
  after_action :update_in_stock, :update_ticket, only: [:update]
  before_action :set_ticket, only: [:update]
  layout 'dashboard'
  
  # GET /buys
  # GET /buys.json
  def index
    @buys = current_user.buys
  end

  # GET /buys/1
  # GET /buys/1.json
  def show
  end

  # GET /buys/new
  def new
    @buy = Buy.new(date: Time.new, user_id: current_user.id)

    respond_to do |format|
      if @buy.save
        format.html { redirect_to @buy, notice: 'Buy was successfully created.' }
        format.json { render :show, status: :created, location: @buy }
      else
        format.html { render :new }
        format.json { render json: @buy.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /buys/1/edit
  def edit
  end

  # POST /buys
  # POST /buys.json
  def create
    @buy = Buy.new(buy_params)

    respond_to do |format|
      if @buy.save
        format.html { redirect_to @buy, notice: 'Buy was successfully created.' }
        format.json { render :show, status: :created, location: @buy }
      else
        format.html { render :new }
        format.json { render json: @buy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buys/1
  # PATCH/PUT /buys/1.json
  def update
    respond_to do |format|
      if @buy.update(buy_params)
        format.html { redirect_to @buy, notice: 'Buy was successfully updated.' }
        format.json { render :show, status: :ok, location: @buy }
      else
        format.html { render :edit }
        format.json { render json: @buy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buys/1
  # DELETE /buys/1.json
  def destroy
    @buy.destroy
    respond_to do |format|
      format.html { redirect_to buys_url, notice: 'Buy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buy
      @buy = Buy.find(params[:id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_tickets
      @tickets = current_user.tickets
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def buy_params
      params.require(:buy).permit(:date, :price, :ticket_id).merge(user_id: current_user.id )
    end
end
