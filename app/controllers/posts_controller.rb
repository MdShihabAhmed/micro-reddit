class PostsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  def index
    @posts = Post.all
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to user_post_path(@user, @post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @post.destroy

    redirect_to user_path(@user)
  end


  private
  def post_params
    params.expect(post: [ :title, :body ])
  end
end
