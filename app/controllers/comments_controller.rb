class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
 
  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@comment.post), notice: "Comentário criado com sucesso." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to post_path(@comment.post), notice: @comment.errors, status: :unprocessable_entity}
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to post_path(@comment.post), notice: "Comentário atualizado com sucesso." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to post_path(@comment.post), notice: @comment.errors, status: :unprocessable_entity}
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    post = @comment.post
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to post_path(post), notice: "Comentário deletado com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body, :user_id, :post_id, :replying_to_comment, :replying_to_user )
    end
end
