class UsersController < ApplicationController
  before_action :check_login

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    # fail
    if @user.save
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find_by_session_token(session[:session_token])
  end


  private

  def user_params
    params.require(:user).permit(:email, :password )
  end
end
