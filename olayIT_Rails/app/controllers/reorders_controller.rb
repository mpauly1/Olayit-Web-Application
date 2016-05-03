class ReordersController < ApplicationController
  before_action :set_reorder, only: [:show, :edit, :update, :destroy]

  # GET /reorders
  # GET /reorders.json
  def index
    @reorders = Reorder.all
  end

  # GET /reorders/1
  # GET /reorders/1.json
  def show
  end

  # GET /reorders/new
  def new
    @reorder = Reorder.new
  end

  # GET /reorders/1/edit
  def edit
  end

  # POST /reorders
  # POST /reorders.json
  def create
    @reorder = Reorder.new(reorder_params)

    respond_to do |format|
      if @reorder.save
        format.html { redirect_to @reorder, notice: 'Reorder was successfully created.' }
        format.json { render :show, status: :created, location: @reorder }
      else
        format.html { render :new }
        format.json { render json: @reorder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reorders/1
  # PATCH/PUT /reorders/1.json
  def update
    respond_to do |format|
      if @reorder.update(reorder_params)
        format.html { redirect_to @reorder, notice: 'Reorder was successfully updated.' }
        format.json { render :show, status: :ok, location: @reorder }
      else
        format.html { render :edit }
        format.json { render json: @reorder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reorders/1
  # DELETE /reorders/1.json
  def destroy
    @reorder.destroy
    respond_to do |format|
      format.html { redirect_to reorders_url, notice: 'Reorder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reorder
      @reorder = Reorder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reorder_params
      params.require(:reorder).permit(:squad_id, :qtyorder, :reorderdate, :expecteddelivery)
    end
end
