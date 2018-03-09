require 'mongoid'

class Buyer
  include Mongoid::Document

  field :identifier, type: String, required: true
  field :name, type: String
end