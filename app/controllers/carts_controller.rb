class CartsController < ApplicationController
  def show
    @current_cart = current_user.current_cart
  end
end
