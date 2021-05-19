class DashboardController < BaseController
  before_action :check_logged_in_user

  def index
    @products = Product.all
  end
end
