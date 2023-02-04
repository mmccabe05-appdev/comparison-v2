class NeighborhoodsController < ApplicationController
  before_action :set_neighborhood, only: %i[ show edit update destroy ]

  # GET /neighborhoods or /neighborhoods.json
  def index
    @neighborhoods = Neighborhood.all
  end

  # GET /neighborhoods/1 or /neighborhoods/1.json
  def show
  end

  # GET /neighborhoods/new
  def new
    @neighborhood = Neighborhood.new
  end

  # GET /neighborhoods/1/edit
  def edit
  end

  # POST /neighborhoods or /neighborhoods.json
  def create
    @neighborhood = Neighborhood.new(neighborhood_params)

    respond_to do |format|
      if @neighborhood.save
        format.html { redirect_to neighborhood_url(@neighborhood), notice: "Neighborhood was successfully created." }
        format.json { render :show, status: :created, location: @neighborhood }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @neighborhood.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /neighborhoods/1 or /neighborhoods/1.json
  def update
    respond_to do |format|
      if @neighborhood.update(neighborhood_params)
        format.html { redirect_to neighborhood_url(@neighborhood), notice: "Neighborhood was successfully updated." }
        format.json { render :show, status: :ok, location: @neighborhood }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @neighborhood.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /neighborhoods/1 or /neighborhoods/1.json
  def destroy
    @neighborhood.destroy

    respond_to do |format|
      format.html { redirect_to neighborhoods_url, notice: "Neighborhood was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_neighborhood
      @neighborhood = Neighborhood.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def neighborhood_params
      params.require(:neighborhood).permit(:name, :city_id, :lat, :lng, :favorite_neighborhoods_count)
    end
end
