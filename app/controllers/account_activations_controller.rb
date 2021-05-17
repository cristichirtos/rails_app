class AccountActivationsController < ApplicationController

  def edit 
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      session[:session_token] = user.session_token
      flash[:success] = 'Account activated!'
      redirect_to root_path
    else
      flash[:danger] = 'Invalid activation link'
      redirect_to login_path
    end
  end
end
