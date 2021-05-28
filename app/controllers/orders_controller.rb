class OrdersController < BaseController
  before_action :check_logged_in_user
  before_action :retrieve_user_cart
  before_action :check_admin_user, only: %i[index toggle_handled]
  
  def create
    order = current_user.orders.build

    @cart.product_carts.each do | product |
      order.product_orders.build(product_id: product.product_id, quantity: product.quantity)
    end
    
    order.save
    @cart.destroy
    flash[:success] = 'Order created!'

    redirect_to (root_url)
  end

  def index
    @orders = Order.all
  end

  def toggle_handled
    order = Order.find(params[:id])
    order.toggle(:handled)
    order.save
    flash[:success] = "Order marked as #{'un' unless order.handled?}handled!"

    redirect_to(orders_url)
  end

  private

    def check_admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
