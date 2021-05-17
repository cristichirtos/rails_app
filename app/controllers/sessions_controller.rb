class SessionsController < ApplicationController

  def new; end

  def create
    session_param = params[:session]
    @user = User.find_by(email: session_param[:email].downcase)
    if @user&.authenticate(session_param[:password])
      if @user.activated?
        reset_session
        log_in @user
        session_param[:remember_me] == '1' ? remember(@user) : forget(@user)
        session[:session_token] = @user.session_token
        redirect_to(root_path)
      else 
        flash[:warning] = 'Account not activated. Check your email for the activation link.'
        redirect_to(login_path)
      end
    else
      flash.now[:danger] = 'Invalid email or password.'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to(root_path)
  end
end
