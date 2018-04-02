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
            @cart = Cart.create @body
            json @cart
          rescue StandardError
            raise ValidationError, @body
          end
        end
      end
    end
  end
end
