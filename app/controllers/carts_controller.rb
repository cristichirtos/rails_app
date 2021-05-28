class CartsController < BaseController
  before_action :check_logged_in_user
  before_action :retrieve_user_cart

  def show; end

  def destroy 
    @cart.destroy

    redirect_to(root_url)
  end
end
