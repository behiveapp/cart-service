require 'mongoid'

class Buyer
  include Mongoid::Document

  field :identifier, type: String
  field :name, type: String
end