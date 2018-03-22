require "sinatra/json"
require_relative "../model/cart"
require_relative "../lib/errors/mongo_errors"

def open_cart
  begin
    @cart = Cart.create @body
    json @cart
  rescue => e
    raise ValidationError.new @body
  end
end