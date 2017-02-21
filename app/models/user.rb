class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :email

  has_many :carts

  def current_cart
    self.carts.find_by_id(self.current_cart_id)
  end

  def current_cart=(cart)
    self.current_cart_id = cart.id
  end
end
