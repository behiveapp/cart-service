require "model/cart"
require "json"

def open_cart
  content_type :json
  Cart.create test: "Test"
end