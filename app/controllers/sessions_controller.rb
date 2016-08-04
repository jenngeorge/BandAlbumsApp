class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if user.nil? || !user.is_password?(params[:user][:password])
      flash.now[:errors] = ["Incorrect username and/or password"]
      render :new
    else
      log_in_user!(user)
      redirect_to user_url(user)
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

end
