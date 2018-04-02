require 'rest-client'
require './src/model/cart'
require_relative 'data_helpers'

def initialize_carts
  Cart.create cart1
  Cart.create cart2
end

def destroy_carts
  Cart.destroy_all
end

def initialize_products
  RestClient.post "http://#{ENV['PRODUCTS_SERVICE_HOST']}/",
                  product1.to_json,
                  content_type: :json, accept: :json
end

def destroy_products
  RestClient.delete "http://#{ENV['PRODUCTS_SERVICE_HOST']}/#{product1['_id']}",
                    content_type: :json, accept: :json
end
