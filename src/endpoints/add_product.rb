require 'sinatra/json'
require 'rest-client'
require 'byebug'
require_relative '../model/cart'
require_relative '../lib/errors/mongo_errors'

module CartService
  module Endpoints
    # Module representing POST /:id/product/:product_id endpoint
    module AddProduct
      def self.do_action(app, _body)
        find_cart app.params[:id]
        find_product app.params[:product_id]
        @cart.products << @product
        @cart.save
        app.json @cart
      rescue Mongoid::Errors::DocumentNotFound
        raise RecordNotFoundError, app.params[:id]
      end

      def self.find_cart(id)
        @cart = Cart.find id
      end

      def self.find_product(id)
        products_endpoint = "http://#{ENV['PRODUCTS_SERVICE_HOST']}/#{id}"
        res = RestClient.get products_endpoint, content_type: :json
        product_hash = JSON.parse(res.body).reject do |key|
          ['__v'].include? key
        end
        @product = Product.new product_hash
      rescue RestClient::NotFound
        raise RecordNotFoundError, id
      end
    end
  end
end
