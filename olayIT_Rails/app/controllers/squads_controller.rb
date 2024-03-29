class SquadsController < ApplicationController
  before_action :set_squad, only: [:show, :edit, :update, :destroy]

  # GET /squads
  # GET /squads.json
  def index
    @squads = Squad.all
  end

  # GET /squads/1
  # GET /squads/1.json
  def show
  end

  # GET /squads/new
  def new
    @squad = Squad.new
  end

  # GET /squads/1/edit
  def edit
  end

  # POST /squads
  # POST /squads.json
  def create
    @squad = Squad.new(squad_params)

    respond_to do |format|
      if @squad.save
        format.html { redirect_to @squad, notice: 'Squad was successfully created.' }
        format.json { render :show, status: :created, location: @squad }
      else
        format.html { render :new }
        format.json { render json: @squad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /squads/1
  # PATCH/PUT /squads/1.json
  def update
    respond_to do |format|
      if @squad.update(squad_params)
        format.html { redirect_to @squad, notice: 'Squad was successfully updated.' }
        format.json { render :show, status: :ok, location: @squad }
      else
        format.html { render :edit }
        format.json { render json: @squad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /squads/1
  # DELETE /squads/1.json
  def destroy
    @squad.destroy
    respond_to do |format|
      format.html { redirect_to squads_url, notice: 'Squad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_squad
      @squad = Squad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def squad_params
      params.require(:squad).permit(:squadname, :squadimage, :description, :category_id, :saleprice, :status, :purchaseprice, :qtyonhand, :reorderpoint, :reorderqty)
    end
end
