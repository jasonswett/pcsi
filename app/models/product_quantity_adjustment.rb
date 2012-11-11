class ProductQuantityAdjustment < ActiveRecord::Base
  attr_accessible :quantity, :product_id, :product
  belongs_to :product
end
