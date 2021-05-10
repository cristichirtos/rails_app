class CartsController < ApplicationController
  before_action :logged_in_user, only: :add_to_cart

  def index
    @cart = get_cart
  end

  def add_to_cart
    add_product_to_cart_cookie(params[:product_id])
  end

  private 
    
    def logged_in_user
      unless logged_in?
        flash[:danger] = 'Please log in.'
        redirect_to login_path
      end
    end
end
