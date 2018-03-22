require "sinatra/json"
require_relative "../model/cart"
require_relative "../lib/errors/mongo_errors"

def get_cart
  begin
    @cart = Cart.find params[:id]

    json @cart
  rescue Mongoid::Errors::DocumentNotFound => e
    raise RecordNotFoundError.new params[:id]
  end
end