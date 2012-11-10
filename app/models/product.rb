class Product < ActiveRecord::Base
  attr_accessible :code, :description, :name, :price_per_unit, :unit_of_measure_id
end
