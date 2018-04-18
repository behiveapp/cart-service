require 'mongoid'
require_relative 'record'

# Class representing Product embedded-collection
class Product < Record
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  embedded_in :cart

  field :seller_identifier, type: String
  field :code, type: String
  field :name, type: String
  field :categories, type: Array
end
