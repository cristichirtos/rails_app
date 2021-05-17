class DashboardController < ApplicationController
  before_action :check_logged_in_user

  def index
    @products = Product.all
  end

  private 
    
    def check_logged_in_user
      unless logged_in?
        flash[:danger] = 'Please log in.'
        
        redirect_to(login_url)
      end
    end
end
