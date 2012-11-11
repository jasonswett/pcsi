class Product < ActiveRecord::Base
  attr_accessible :code, :description, :name, :price_per_unit, :unit_of_measure
  validates_presence_of :name, :price_per_unit, :code
end
