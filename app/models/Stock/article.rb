class Stock::Article < ApplicationRecord
  include ActiveModel::AttributeAssignment
  attr_accessor :number, :description, :specification

end
