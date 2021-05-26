class Cart < ApplicationRecord
  belongs_to :user
  has_many :product_carts, dependent: :destroy
  has_many :products, through: :product_carts, foreign_key: :cart_id

  def add_product!(product_id)
    if product_ids.include?(product_id)
      product_carts.find_by(product_id: product_id).increment!(:quantity)
    else 
      products << Product.find(product_id)
    end
  end

  def remove_product!(product_id)
    return unless product_ids.include?(product_id)

    product_cart = product_carts.find_by(product_id: product_id)
    if product_cart.quantity == 1
      product_cart.delete
    else
      product_cart.decrement!(:quantity)
    end
  end

  def count
    product_carts.sum(:quantity)
  end

  def total_price
    product_carts.inject(0) { |sum, product_cart| sum += product_cart.quantity * products.find(product_cart.product_id).price }
  end
end
