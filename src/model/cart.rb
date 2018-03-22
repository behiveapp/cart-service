require 'mongoid'
require_relative 'seller'
require_relative 'buyer'
require_relative 'product'

class Cart
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  
  embeds_one :buyer
  embeds_one :seller
  embeds_many :products
  accepts_nested_attributes_for :buyer, :seller, :products
end