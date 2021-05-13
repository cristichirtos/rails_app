module SessionsHelper

  def log_in(user)
    reset_session
    session[:user_id] = user.id
    session[:cart] = {}
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def log_out
    reset_session
    @current_user = nil
  end

  def add_product_to_cart_cookie(product_id)
    session[:cart][product_id].nil? ? session[:cart][product_id] = 1 : session[:cart][product_id] += 1
  end

  def cart_count
    session[:cart].values.inject(0) { |sum, value| sum += value }
  end

  def get_cart 
    session[:cart]
  end
end
