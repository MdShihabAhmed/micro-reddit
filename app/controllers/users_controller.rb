class UsersController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     redirect_to @user
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
