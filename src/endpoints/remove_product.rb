require 'sinatra/json'
require_relative '../model/cart'
require_relative '../lib/errors/mongo_errors'

module CartService
  module Endpoints
    # Module representing DELETE /:id/product/:product_id endpoint
    module RemoveProduct
      def self.do_action(app, _body)
        find_cart app.params[:id]
        find_product app.params[:product_id]
        @product.destroy
        app.json @cart
      rescue Mongoid::Errors::DocumentNotFound
        raise RecordNotFoundError, app.params[:id]
      end

      def self.find_cart(id)
        @cart = Cart.find id
      end

      def self.find_product(id)
        query = { '_id' => id }
        @product = @cart.products.where(query).first
        raise RecordNotFoundError, id if @product.nil?
      end
    end
  end
end
