class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :transactions
  has_one_attached :product_image
end
