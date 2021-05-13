class CartsController < ApplicationController

  def index
    @cart = get_cart
  end

  def add_to_cart
    if logged_in?
      add_product_to_cart_cookie(params[:product_id])
      redirect_to root_path
    else
      redirect_to login_path
    end
  end
end
