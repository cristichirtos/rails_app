class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save 
      log_in @user 
      remember @user
      session[:session_token] = @user.session_token
      flash[:success] = 'Welcome to Eureka Caffe!'
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end
end
