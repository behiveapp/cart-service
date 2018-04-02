require 'sinatra/json'
require_relative '../model/cart'
require_relative '../lib/errors/mongo_errors'

module CartService
  module Endpoints
    # Module representing DELETE /:id/product/:product_id endpoint
    module RemoveProduct
      def self.registered(app)
        app.delete '/:id/product/:product_id' do
          extend CartService::Endpoints::RemoveProduct::Actions
          do_action
        end
      end

      # Module representing private helpers for the endpoint
      module Actions
        def do_action
          find_cart params[:id]
          find_product params[:product_id]
          @product.destroy
          json @cart
        rescue Mongoid::Errors::DocumentNotFound
          raise RecordNotFoundError, params[:id]
        end

        def find_cart(id)
          @cart = Cart.find id
        end

        def find_product(id)
          query = { '_id' => id }
          @product = @cart.products.where(query).first
          raise RecordNotFoundError, id if @product.nil?
        end
      end
    end
  end
end
