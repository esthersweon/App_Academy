class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    render :new
  end

  def create
    @parent_comment = Comment.find(params[:parent_comment_id])
    @comment = @parent_comment.children.new(comment_params)

    if @comment.save
      #redirect_to
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end

  end

  def edit

  end

  private

  def comment_params
    params.require(:comment).permit(:title, :body, :parent_comment_id)
  end
end
