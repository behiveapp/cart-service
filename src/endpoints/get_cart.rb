require 'sinatra/json'
require_relative '../model/cart'
require_relative '../lib/errors/mongo_errors'
require 'byebug'

module CartService
  module Endpoints
    # Module representing POST /:id endpoint
    module GetCart
      def self.do_action(app, _body)
        @cart = Cart.find app.params[:id]
        app.json @cart
      rescue Mongoid::Errors::DocumentNotFound
        raise RecordNotFoundError, app.params[:id]
      end
    end
  end
end
