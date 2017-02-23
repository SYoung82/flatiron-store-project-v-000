class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  validates_uniqueness_of :email
  validates_confirmation_of :password

  has_many :carts
  belongs_to :current_cart, class_name: 'Cart'

  def create_current_cart
    new_cart = self.carts.build
    self.current_cart_id = new_cart.id
    self.save
  end

  def current_cart
    self.carts.find_by_id(self.current_cart_id)
  end

  def current_cart=(cart)
    self.current_cart_id = cart.id
  end
end
