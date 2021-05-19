class BaseController < ApplicationController

  private

    def check_logged_in_user
      return if logged_in?
      
      flash[:danger] = 'Please log in.'
        
      redirect_to(login_url)
    end
end
