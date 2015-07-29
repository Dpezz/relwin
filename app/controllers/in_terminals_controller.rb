class InTerminalsController < ApplicationController
  include InTerminalsHelper
  before_action :set_vendors, :set_terminals, only: [:new, :create, :edit, :update]
  before_action :set_in_terminal, only: [:show, :edit, :update, :destroy]
  after_action :set_in_terminal_active, only: [:create, :update]
  after_action :set_total_price, only: [:update]
  
  layout 'dashboard'
  
  # GET /in_terminals
  # GET /in_terminals.json
  def index
    @in_terminals = current_user.in_terminals
  end

  # GET /in_terminals/1
  # GET /in_terminals/1.json
  def show
  end

  # GET /in_terminals/new
  def new
    @in_terminal = InTerminal.new
  end

  # GET /in_terminals/1/edit
  def edit
  end

  # POST /in_terminals
  # POST /in_terminals.json
  def create
    @in_terminal = InTerminal.new(in_terminal_params)

    respond_to do |format|
      if @in_terminal.save
        format.html { redirect_to in_terminal_path(@in_terminal), notice: 'In terminal was successfully created.' }
        format.json { render :show, status: :created, location: @in_terminal }
      else
        format.html { render :new }
        format.json { render json: @in_terminal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /in_terminals/1
  # PATCH/PUT /in_terminals/1.json
  def update
    respond_to do |format|
      if @in_terminal.update(in_terminal_params)
        format.html { redirect_to in_terminal_path(@in_terminal), notice: 'In terminal was successfully updated.' }
        format.json { render :show, status: :ok, location: @in_terminal }
      else
        format.html { render :edit }
        format.json { render json: @in_terminal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /in_terminals/1
  # DELETE /in_terminals/1.json
  def destroy
    @in_terminal.destroy
    respond_to do |format|
      format.html { redirect_to in_terminals_path, notice: 'In terminal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_in_terminal
      @in_terminal = InTerminal.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_vendors
      @vendors = current_user.vendors
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_terminals
      @terminals = current_user.terminals
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def in_terminal_params
      params.require(:in_terminal).permit(:terminal_id, :vendor_id, :start_p, :total_p, :end_p, :start_date, :end_date, :is_active).merge(user_id: current_user.id)
    end
end
