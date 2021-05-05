class Product < ApplicationRecord
  has_one_attached :image
  validates :title, length: { maximum: 25 }, presence: true
  validates :description, length: { maximum: 50 }, presence: true
  validates :price, presence: true, numericality: { only_float: true, greater_than: 0 }
end
