class FavoriteNeighborhoodsController < ApplicationController
  before_action :set_favorite_neighborhood, only: %i[ show edit update destroy ]

  # GET /favorite_neighborhoods or /favorite_neighborhoods.json
  def index
    @favorite_neighborhoods = FavoriteNeighborhood.all
  end

  # GET /favorite_neighborhoods/1 or /favorite_neighborhoods/1.json
  def show
  end

  # GET /favorite_neighborhoods/new
  def new
    @favorite_neighborhood = FavoriteNeighborhood.new
  end

  # GET /favorite_neighborhoods/1/edit
  def edit
  end

  # POST /favorite_neighborhoods or /favorite_neighborhoods.json
  def create
    @favorite_neighborhood = FavoriteNeighborhood.new(favorite_neighborhood_params)

    respond_to do |format|
      if @favorite_neighborhood.save
        format.html { redirect_to favorite_neighborhood_url(@favorite_neighborhood), notice: "Favorite neighborhood was successfully created." }
        format.json { render :show, status: :created, location: @favorite_neighborhood }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @favorite_neighborhood.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favorite_neighborhoods/1 or /favorite_neighborhoods/1.json
  def update
    respond_to do |format|
      if @favorite_neighborhood.update(favorite_neighborhood_params)
        format.html { redirect_to favorite_neighborhood_url(@favorite_neighborhood), notice: "Favorite neighborhood was successfully updated." }
        format.json { render :show, status: :ok, location: @favorite_neighborhood }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @favorite_neighborhood.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorite_neighborhoods/1 or /favorite_neighborhoods/1.json
  def destroy
    @favorite_neighborhood.destroy

    respond_to do |format|
      format.html { redirect_to favorite_neighborhoods_url, notice: "Favorite neighborhood was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_neighborhood
      @favorite_neighborhood = FavoriteNeighborhood.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favorite_neighborhood_params
      params.require(:favorite_neighborhood).permit(:user_id, :neighborhood_id)
    end
end
