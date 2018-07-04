class RepliesController < ApplicationController
  def new
    @reply = Reply.new(reply_params)
  end

  def show
    @comment = Comment.find(params[:id])
    @replies = @comment.replies.all
    @reply = @comment.replies.build
  end
  
  def edit
    @reply = Reply.find(params[:id])
  end

  def create
    @reply = Reply.new(reply_params)
    respond_to do |format|
      if @reply.save
        format.html { redirect_to post_path(@reply.comment.post_id), notice: 'Comment was successfully created.' }
        format.js
      else
        render 'new'
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
    def set_reply
      @reply = Reply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reply_params
      params.require(:reply).permit(:content, :comment_id, :user_id)
    end
end
