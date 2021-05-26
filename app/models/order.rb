class Order < ApplicationRecord
  belongs_to :user
  has_many :product_orders, dependent: :destroy
  has_many :products, through: :product_orders, foreign_key: :order_id
end
