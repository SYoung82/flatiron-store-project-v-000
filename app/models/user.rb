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
    new_cart = self.carts.create
    self.current_cart_id = new_cart.id
    self.save
  end

  def remove_current_cart
    self.current_cart_id = nil
    self.save
  end

end
