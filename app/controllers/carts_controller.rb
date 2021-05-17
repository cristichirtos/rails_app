class CartsController < ApplicationController
  before_action :check_logged_in_user

  def index
    @cart = get_cart
  end

  def add_to_cart
    add_product_to_cart(params[:product_id])
    redirect_to(root_url)
  end

  private 
    
    def check_logged_in_user
      unless logged_in?
        flash[:danger] = 'Please log in.'
        redirect_to(login_url)
      end
    end
end
