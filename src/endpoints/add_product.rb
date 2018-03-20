require "model/cart"
require "sinatra/json"
require 'lib/errors/mongo_errors'
require 'byebug'

def add_product
  begin
    @cart = Cart.find params[:id]
    @cart.products << Product.new(@body)

    json @cart
  rescue Mongoid::Errors::DocumentNotFound => e
    raise RecordNotFoundError.new params[:id]
  rescue => e
    raise ValidationError.new [@body, e]
  end
end