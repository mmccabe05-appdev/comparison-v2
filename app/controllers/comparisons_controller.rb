class ComparisonsController < ApplicationController
  before_action :set_comparison, only: %i[ show edit update destroy ]

  # GET /comparisons or /comparisons.json
  def index
    @comparisons = Comparison.all
  end

  # GET /comparisons/1 or /comparisons/1.json
  def show
  end

  # GET /comparisons/new
  def new
    @comparison = Comparison.new
  end

  # GET /comparisons/1/edit
  def edit
  end

  # POST /comparisons or /comparisons.json
  def create
    @comparison = Comparison.new(comparison_params)
    
    @comparison.overall_similarity = (@comparison.culinary_similarity + @comparison.transportation_similarity + @comparison.people_similarity + @comparison.built_environment_similarity)/4

    @comparison.net_comparison_score = @comparison.overall_similarity * @comparison.net_votes

    respond_to do |format|
      if @comparison.save
        format.html { redirect_to comparison_url(@comparison), notice: "Comparison was successfully created." }
        format.json { render :show, status: :created, location: @comparison }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comparison.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comparisons/1 or /comparisons/1.json
  def update
    respond_to do |format|
      if @comparison.update(comparison_params)
        format.html { redirect_to comparison_url(@comparison), notice: "Comparison was successfully updated." }
        format.json { render :show, status: :ok, location: @comparison }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comparison.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comparisons/1 or /comparisons/1.json
  def destroy
    @comparison.destroy

    respond_to do |format|
      format.html { redirect_to comparisons_url, notice: "Comparison was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comparison
      @comparison = Comparison.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comparison_params
      params.require(:comparison).permit(:body, :user_id, :culinary_similarity, :transportation_similarity, :people_similarity, :built_environment_similarity, :overall_similarity, :neighborhood_1_id, :neighborhood_2_id, :net_comparison_score, :net_votes, :likes_count, :comments_count)
    end
end
