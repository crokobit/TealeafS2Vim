class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)#important
    @comment.creator = User.first #TO DO, after implemting log in mechanism
    if @comment.save
      flash[:notice] = 'Leave a comment'
      redirect_to post_path(@post)
    else
      flash[:error] = 'ERROR'
      render :back
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
