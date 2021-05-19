class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save 
      @user.send_activation_email
      flash[:info] = 'Please check your email to activate your account.'

      redirect_to(login_url)
    else
      render 'new'
    end

  rescue Net::SMTPUnknownError
    flash[:danger] = 'Your email is not on the Mailgun Authorized Recipients list. Please contact me to add your email.'
    
    redirect_to(login_url)
  end

  private

    def user_params
      params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end
end
