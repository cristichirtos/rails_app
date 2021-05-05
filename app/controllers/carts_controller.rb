class CartsController < ApplicationController
  def add_to_cart
    if logged_in?
      add_to_cartt(params[:product])
    else
      redirect_to login_path
    end
  end
end
