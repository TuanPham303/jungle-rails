class CommentsController < ApplicationController
  before_filter :authorize

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.build(comment_params)
    @comment.commenter = current_user.name
    @comment.user_id = current_user.id
    @comment.save
    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find(params[:product_id])
    @comment = @product.comments.find(params[:id])
    @comment.destroy
    redirect_to product_path(@product)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:body, :rating)
    end
end
