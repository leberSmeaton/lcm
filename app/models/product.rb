class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :transactions
  has_one_attached :product_image

  before_save :remove_whitespace
  before_save :replace_ebay
  before_save :convert_price_to_cents, if: :product_price_changed?


  private
  def remove_whitespace
    self.product_name = self.product_name.strip
    self.product_description = self.product_description.strip
  end

  def replace_ebay
    self.product_name = self.product_name.gsub(/ebay/i, "marketplace")
    self.product_description = self.product_description.gsub(/ebay/i, "marketplace")
  end

  def convert_price_to_cents
    self.product_price = (self.attributes_before_type_cast["product_price"].to_f * 100).round
  end
end
