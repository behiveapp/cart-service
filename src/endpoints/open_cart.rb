require "model/cart"
require "sinatra/json"
require 'lib/errors/validation_error'
require 'byebug'

def open_cart
  begin
    @cart = Cart.create @body
    json @cart
  rescue => e
    byebug
    raise ValidationError.new @body
  end
end