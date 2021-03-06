class PasswordResetsController < ApplicationController
  before_action :get_user,         only: [:edit, :update]
  before_action :valid_user,       only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new; end

  def create 
    @user = User.find_by(email: params[:password_reset][:email].downcase)

    if @user 
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = 'Email sent with password reset instructions'

      redirect_to(login_url)
    else
      flash.now[:danger] = 'Email address not found'
      render 'new'
    end

  rescue Net::SMTPUnknownError
    flash[:danger] = 'Your email is not on the Mailgun Authorized Recipients list. Please contact me to add your email.'

    redirect_to(login_url)
  end

  def edit; end

  def update 
    if params[:user][:password].empty? 
      @user.errors.add(:password, :blank)
      render 'edit'
    elsif @user.update(user_params)
      log_in(@user) 
      session[:session_token] = @user.session_token
      flash[:success] = 'Password has been reset'

      redirect_to(root_url)
    else
      render 'edit'
    end
  end

  private

    def user_params 
      params.require(:user).permit(:password, :password_confirmation)
    end

    def get_user 
      @user = User.find_by(email: params[:email])
    end

    def valid_user 
      redirect_to rooth_url unless @user && @user.activated? && @user.authenticated?(:reset, params[:id])
    end

    def check_expiration 
      return unless @user.password_reset_expired?
        
      flash[:danger] = 'Password reset has expired.'
        
      redirect_to(new_password_reset_url)
    end
end
