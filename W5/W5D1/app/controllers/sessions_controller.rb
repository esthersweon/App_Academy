class SessionsController < ApplicationController
  def new
    @user = User.new
    @users = User.all
    render :new
  end

  def create
    @user = User.find_by_email(user_params[:email])
    login(@user) if @user.is_password?(user_params[:password])

    redirect_to new_session_url
  end

  def destroy
    logout
    redirect_to new_session_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
