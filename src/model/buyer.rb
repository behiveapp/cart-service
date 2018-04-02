require 'mongoid'
require_relative 'record'

# Class representing Buyer embedded-collection
class Buyer < Record
  include Mongoid::Document

  field :identifier, type: String
  field :name, type: String
end
