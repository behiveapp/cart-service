require 'mongoid'

class Product
  include Mongoid::Document

  field :code, type: String
  field :name, type: String
end