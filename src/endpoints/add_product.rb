require "sinatra/json"
require_relative "../model/cart"
require_relative '../lib/errors/mongo_errors'

def add_product
  begin
    @cart = Cart.find params[:id]
    @cart.products << Product.new(@body)
    @cart.save

    json @cart
  rescue Mongoid::Errors::DocumentNotFound => e
    raise RecordNotFoundError.new params[:id]
  end
end