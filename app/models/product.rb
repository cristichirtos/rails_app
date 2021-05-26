class Product < ApplicationRecord
  has_many :product_carts, dependent: :destroy
  has_many :carts, through: :product_carts, foreign_key: :product_id

  has_many :product_orders, dependent: :destroy 
  has_many :orders, through: :product_orders, foreign_key: :product_id

  has_one_attached :image
  validates :title, length: { maximum: 25 }, presence: true
  validates :description, length: { maximum: 50 }, presence: true
  validates :price, presence: true, numericality: { only_float: true, greater_than: 0 }
end
