class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products, dependent: :destroy
  has_one :address, dependent: :destroy
  has_many :transactions
  has_many :purchased_products, through: :transactions, source: :product

  accepts_nested_attributes_for :address, allow_destroy: true
  before_save :remove_whitespace
  before_save :enforce_lower_case_username

  def with_address
    build_address if address.nil?
    self
  end

  private
  def remove_whitespace
    self.fullname = self.fullname.strip
    self.profile_info = self.profile_info.strip
  end

  def enforce_lower_case_username
    self.username = self.username.downcase
  end

end
