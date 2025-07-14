class CommentsController < ApplicationController
  before_action :authenticate_user
  def create
    @user = User.find(session[:user_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to user_post_path(@user, @post)
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :user_id)
    end
end
