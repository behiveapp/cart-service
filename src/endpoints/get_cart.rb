require 'sinatra/json'
require_relative '../model/cart'
require_relative '../lib/errors/mongo_errors'
require 'byebug'

module CartService
  module Endpoints
    # Module representing GET /:id endpoint
    module GetCart
      def self.registered(app)
        app.get '/:id' do
          begin
            @cart = Cart.find params[:id]
            json @cart
          rescue Mongoid::Errors::DocumentNotFound
            raise RecordNotFoundError, params[:id]
          end
        end
      end
    end
  end
end
