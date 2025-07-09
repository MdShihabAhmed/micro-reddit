class CommentsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id=params[:user_id]
    @comment.save
    redirect_to user_post_path(@user,@post)
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
