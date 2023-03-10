class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    authorize @comment
    respond_to do |format|
      format.js do
        render template: "comments/edit.js.erb"
      end
    end
  end

  # POST /comments or /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.commenter_id = current_user.id
    # @comment.comparison_id = @comparison.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to comparison_url(@comment.comparison_id), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
        format.js do
          render template: "comments/create.js.erb"
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to comment_url(@comment), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
        format.js do
          render template: "comments/update.js.erb"
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    authorize @comment
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
      format.js do
        render template: "comments/destroy.js.erb"
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body, :commenter_id, :comparison_id)
    end
end
