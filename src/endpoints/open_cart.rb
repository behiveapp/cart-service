require "model/cart"
require "sinatra/json"
require 'lib/errors/validation_error'

def open_cart
  begin
    @cart = Cart.create @body
    json @cart
  rescue => e
    raise ValidationError.new @body
  end
end