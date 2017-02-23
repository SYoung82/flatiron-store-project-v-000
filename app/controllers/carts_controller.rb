class CartsController < ApplicationController
  def show
    if current_user && current_user.current_cart
      @cart = current_user.current_cart
    end
  end

  def checkout
    @cart = current_user.carts.find(params[:id])
    @cart.checkout
    binding.pry
    redirect_to cart_path(@cart)
  end
end
