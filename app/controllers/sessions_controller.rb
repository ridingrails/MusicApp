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
      flash.now[:notice] = "Invalid login"
      render :new
    end
  end

  def destroy
    logout_user
  end
end
