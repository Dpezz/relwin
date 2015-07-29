class InVendorsController < ApplicationController
  include InVendorsHelper
  before_action :set_vendors, only: [:new, :create, :edit, :update]
  before_action :set_in_vendor, only: [:show, :edit, :update, :destroy]
  after_action :set_in_vendor_active, only: [:create]
  after_action :update_total_p, only: [:update]
  layout 'dashboard'

  # GET /in_vendors
  # GET /in_vendors.json
  def index
    @in_vendors = current_user.in_vendors
  end

  # GET /in_vendors/1
  # GET /in_vendors/1.json
  def show
  end

  # GET /in_vendors/new
  def new
    @in_vendor = InVendor.new
  end

  # GET /in_vendors/1/edit
  def edit
  end

  # POST /in_vendors
  # POST /in_vendors.json
  def create
    @in_vendor = InVendor.new(in_vendor_params)

    respond_to do |format|
      if @in_vendor.save
        format.html { redirect_to @in_vendor, notice: 'In vendor was successfully created.' }
        format.json { render :show, status: :created, location: @in_vendor }
      else
        format.html { render :new }
        format.json { render json: @in_vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /in_vendors/1
  # PATCH/PUT /in_vendors/1.json
  def update
    respond_to do |format|
      if @in_vendor.update(in_vendor_params)
        format.html { redirect_to @in_vendor, notice: 'In vendor was successfully updated.' }
        format.json { render :show, status: :ok, location: @in_vendor }
      else
        format.html { render :edit }
        format.json { render json: @in_vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /in_vendors/1
  # DELETE /in_vendors/1.json
  def destroy
    @in_vendor.destroy
    respond_to do |format|
      format.html { redirect_to in_vendors_url, notice: 'In vendor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_in_vendor
      @in_vendor = InVendor.find(params[:id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_vendors
      @vendors = current_user.vendors
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def in_vendor_params
      params.require(:in_vendor).permit(:vendor_id, :start_date, :end_date, :is_active).merge(user_id: current_user.id)
    end
end
