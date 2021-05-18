class CartsController < BaseController
  before_action :check_logged_in_user

  def index
    @cart = get_cart
  end

  def add_to_cart
    add_product_to_cart(params[:product_id])

    redirect_to(root_url)
  end
end
