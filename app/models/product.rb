class Product < ActiveRecord::Base
  attr_accessible :code, :description, :name, :price_per_unit, :unit_of_measure
  validates_presence_of :name, :price_per_unit, :code
  validates_uniqueness_of :code
  has_many :product_quantity_adjustments

  def quantity
    return 0 if new_record?
    product_quantity_adjustments.sum("quantity")
  end

  def update_quantity(quantity)
    save! if new_record?
    ProductQuantityAdjustment.create!(
      :product => self,
      :quantity => quantity.to_i - self.quantity
    )
  end
end
