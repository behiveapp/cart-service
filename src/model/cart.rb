require 'mongoid'
require 'model/seller'
require 'model/buyer'
require 'model/product'

class Cart
  include Mongoid::Document
  embeds_one :buyer
  embeds_one :seller
  embeds_many :products
end