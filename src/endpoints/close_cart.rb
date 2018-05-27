require 'sinatra/json'
require 'rest-client'
require 'byebug'
require_relative '../model/cart'
require_relative '../lib/errors/mongo_errors'

module CartService
  module Endpoints
    # Module representing POST /:id/product/:product_id endpoint
    module CloseCart
      def self.registered(app)
        app.put '/:id/close' do
          extend CartService::Endpoints::CloseCart::Actions
          do_action
        end
      end

      # Module representing private helpers for the endpoint
      module Actions
        def do_action
          find_cart params[:id]
          @cart.status = 1
          @cart.save
          json @cart
        rescue Mongoid::Errors::DocumentNotFound
          raise RecordNotFoundError, params[:id]
        end

        def find_cart(id)
          @cart = Cart.find id
        end
      end
    end
  end
end
