require 'sinatra/json'
require_relative '../model/cart'
require_relative '../lib/errors/mongo_errors'
require 'byebug'

module CartService
  module Endpoints
    # Module representing GET /:id endpoint
    module FromBuyer
      def self.registered(app)
        app.get '/from-buyer/:buyer_id' do
          begin
            @cart = Cart.where(
              'buyer._id' => BSON::ObjectId.from_string(params[:buyer_id])
            ).where status: (params['status'] || 0)
            json @cart
          rescue Mongoid::Errors::DocumentNotFound, BSON::ObjectId::Invalid
            raise RecordNotFoundError, params[:buyer_id]
          end
        end
      end
    end
  end
end
