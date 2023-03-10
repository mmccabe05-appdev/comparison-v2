class ComparisonsController < ApplicationController
  before_action :set_comparison, only: %i[ show edit update destroy upvote downvote ]

  ActiveRecord::Base.connection.tables.each do |table_name| 
    ActiveRecord::Base.connection.reset_pk_sequence!(table_name)
  end

  # GET /comparisons or /comparisons.json
  def index
    @comparisons = Comparison.includes(:user).includes(:city_1).includes(:city_2).all
  end

  def top
    @comparisons = Comparison.includes(:user).includes(:city_1).includes(:city_2).all.order(net_comparison_score: :desc).first(10)
  end 
  def worst
    @comparisons = Comparison.includes(:user).includes(:city_1).includes(:city_2).all.order(net_comparison_score: :asc).first(10)
  end 
  # GET /comparisons/1 or /comparisons/1.json
  def show
  end

  # GET /comparisons/new
  def new
    @comparison = Comparison.new.includes(:city)
  end

  # GET /comparisons/1/edit
  def edit
    authorize @comparison
    redirect_back(fallback_location: root_url)

  end

  # POST /comparisons or /comparisons.json
  def create
    @comparison = Comparison.create(comparison_params)
    @comparison.user_id = current_user.id
    @comparison.upvotes = 1
    @comparison.overall_similarity = (@comparison.culinary_similarity + @comparison.transportation_similarity + @comparison.people_similarity + @comparison.built_environment_similarity)/4.0

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

  def upvote
    @comparison.upvotes = @comparison.upvotes + 1
    @comparison.net_votes = @comparison.upvotes - @comparison.downvotes
    @comparison.net_comparison_score = @comparison.net_votes * @comparison.overall_similarity
    @comparison.user.update(karma: Comparison.where(user: @comparison.user).order(net_comparison_score: :desc).sum(:net_comparison_score))

    respond_to do |format|
      if @comparison.save
        format.html { redirect_to comparison_url(@comparison), notice: "Upvote received." }
        format.json { render :show, status: :ok, location: @comparison }
        format.js do 
          render template: "comparisons/upvote.js.erb"
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comparison.errors, status: :unprocessable_entity }
      end
    end
  end 

  def downvote
    @comparison.downvotes = @comparison.downvotes + 1
    @comparison.net_votes = @comparison.upvotes - @comparison.downvotes
    @comparison.net_comparison_score = @comparison.net_votes * @comparison.overall_similarity
    @comparison.user.update(karma: Comparison.where(user: @comparison.user).order(net_comparison_score: :desc).sum(:net_comparison_score))

    respond_to do |format|
      if @comparison.save
        format.html { redirect_to comparison_url(@comparison), notice: "Downvote received." }
        format.json { render :show, status: :ok, location: @comparison }
        format.js do 
          render template: "comparisons/downvote.js.erb"
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comparison.errors, status: :unprocessable_entity }
      end
    end
  end 

  # PATCH/PUT /comparisons/1 or /comparisons/1.json
  def update
    @comparison.update(comparison_params)
    @comparison.overall_similarity = (@comparison.culinary_similarity + @comparison.transportation_similarity + @comparison.people_similarity + @comparison.built_environment_similarity)/4.0

    @comparison.net_comparison_score = @comparison.overall_similarity * @comparison.net_votes

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
    authorize @comparison
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
      params.require(:comparison).permit(:body, :user_id, :culinary_similarity, :transportation_similarity, :people_similarity, :built_environment_similarity, :overall_similarity, :neighborhood_1_id, :neighborhood_2_id, :net_comparison_score, :net_votes, :likes_count, :comments_count, :upvotes, :downvotes)
    end
end
