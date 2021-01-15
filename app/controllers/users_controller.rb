class UsersController < ApplicationController
  before_action :set_person, only:[:show]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to @user
  end
  
  def show
  end

  def index
    @users = User.all
  end

  private
  def set_person
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name)
  end

end
