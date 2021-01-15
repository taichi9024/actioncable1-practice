class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def destroy
    reset_session
    redirect_to new_session_path
  end

private

def session_params
  params.require(:name)
end

end
