require 'sinatra/json'
require_relative '../model/cart'
require_relative '../lib/errors/mongo_errors'
require 'byebug'
module CartService
  module Endpoints
    # Module representing POST / endpoint
    module OpenCart
      def self.registered(app)
        app.post '/' do
          begin
            buyer_id = @body['buyer']['_id']
            existing_cart = Cart.from_buyer(buyer_id).opened.first
            @cart = existing_cart || (Cart.create @body)
            json @cart
          rescue StandardError, BSON::ObjectId::Invalid
            raise ValidationError, @body
          end
        end
      end
    end
  end
end
