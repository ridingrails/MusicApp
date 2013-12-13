class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:email],
      params[:user][:password])
    if user
      login_user(user)
    else
      flash.now[:errors] = "Invalid login"
    end
  end

  def destroy
    user = User.find(params[:id])
    logout_user(user)
  end
end
