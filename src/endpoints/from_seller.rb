require 'sinatra/json'
require_relative '../model/cart'
require_relative '../lib/errors/mongo_errors'
require 'byebug'

module CartService
  module Endpoints
    # Module representing GET /:id endpoint
    module FromSeller
      def self.registered(app)
        app.get '/from_seller/:seller_id' do
          begin
            @cart = Cart.where(
              'seller._id' => BSON::ObjectId.from_string(params[:seller_id])
            ).where status: (params['status'] || 0)
            json @cart
          rescue Mongoid::Errors::DocumentNotFound
            raise RecordNotFoundError, params[:seller_id]
          end
        end
      end
    end
  end
end
