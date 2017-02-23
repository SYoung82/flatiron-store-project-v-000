class SessionsController < ApplicationController
  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.valid_password?(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to store_url
    else
      redirect_to signin_path, notice: "Invalid signin information."
    end
  end

  def destroy
    session.destroy
    redirect_to store_url
  end
end
