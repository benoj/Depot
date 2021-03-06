class ApplicationController < ActionController::Base
  protect_from_forgery

  private 
  def current_cart 
  	begin
  		Cart.find(session[:cart_id])
  	rescue 
  		cart = Cart.create
  		session[:cart_id] = cart.id
  		return cart
  	end
  end
end
