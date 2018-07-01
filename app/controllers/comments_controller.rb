class CommentsController < ApplicationController
  def new
    @comment = Comment.new(parent_id: params[:parent_id])
  end

  def show
  	@comments = @post.comments.all
    @comment = @post.comments.build
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@comment.post_id), notice: 'Comment was successfully created.' }
        format.js
      end
    end
  end
  
  def destroy
  	@comment = Comment.find(params[:id])
  	post = @comment.post
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post, notice: 'Comment was successfully destroyed.' }
      format.js
    end
  end

  def update
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.update_attributes(comment_params)
        format.html { redirect_to @comment.post, notice: 'Comment was successfully created.' }
        format.js      
      else
        render 'edit'
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :user_id, :post_id)
    end
end
