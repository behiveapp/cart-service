require 'mongoid'
require_relative 'record'
require_relative 'seller'
require_relative 'buyer'
require_relative 'product'

# Class representing Cart collection
class Cart < Record
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  field :status, type: Integer, default: 0

  embeds_one :buyer
  embeds_one :seller
  embeds_many :products
  accepts_nested_attributes_for :buyer, :seller, :products

  scope :open, -> { where(status: 0) }
  scope :paid, -> { where(status: 1) }
  scope :expired, -> { where(status: 2) }
end
