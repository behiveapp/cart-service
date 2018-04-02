require 'mongoid'
require_relative 'record'

# Class representing Seller embedded-collection
class Seller < Record
  include Mongoid::Document
  field :identifier, type: String
  field :full_name, type: String
  field :short_name, type: String
end
