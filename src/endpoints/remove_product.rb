require "model/cart"
require "sinatra/json"
require 'lib/errors/mongo_errors'
require 'byebug'

def remove_product
  begin
    @cart = Cart.find params[:id]

    #TODO: Improve querying on Mongoid sub-collections
    @product = (@cart.products.select {|product| 
      (@body.to_a - product.attributes.keys.reduce({}) {|prev, k| 
        prev.merge({k => product.attributes[k].to_s})
      }.to_a).empty?
    }).first

    raise RecordNotFoundError.new(@body) if @product.nil?

    @product.destroy
    
    json @cart
  rescue Mongoid::Errors::DocumentNotFound => e
    raise RecordNotFoundError.new params[:id]
  end
end