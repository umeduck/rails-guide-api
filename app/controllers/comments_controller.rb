class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    
    if comment.save
      render json: comment, status: :created
    else
      render json: { errors: comment.errors.messages },status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body, :article_id)
  end
end