class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_one :address, dependent: :destroy
  has_many :transactions

  accepts_nested_attributes_for :address, allow_destroy: true

  def with_address
    build_address if address.nil?
    self
  end

end
