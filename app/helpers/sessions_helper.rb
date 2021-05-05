module SessionsHelper

  def log_in(user)
    reset_session
    session[:user_id] = user.id
    session[:cart] = Hash.new(0)
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    reset_session
    @current_user = nil
  end

  def add_to_cartt(product)
    session[:cart][product.id] += 1
  end
end
