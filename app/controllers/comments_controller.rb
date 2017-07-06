class CommentsController < ApplicationController
  def show
    @user = User.find(@comment.author)
  end

  def create
    image = Image.find(params[:image_id])
    @comment = image.comments.build(comment_params)
    @comment.author = current_user.id
    if @comment.save
    flash[:notice] = "Comment successfully added!"
      redirect_to request.env['HTTP_REFERER']
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:notice] = "Comment successfully removed!"
      redirect_to request.env['HTTP_REFERER']
    end
  end

  private
    def comment_params
      # Use strict parameters, replace placeholder info below with your class' actual attributes
      params.require(:comment).permit( :body, :image_id, :author)
    end
end
