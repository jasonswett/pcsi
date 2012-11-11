require 'spec_helper'

describe ProductQuantityAdjustment do
  before(:each) do
    @product_quantity_adjustment = FactoryGirl.build(:product_quantity_adjustment)
  end

  subject { @product_quantity_adjustment }

  it { should be_valid }

  describe "when product_id is blank" do
    before { @product_quantity_adjustment.product_id = nil }
    it { should_not be_valid }
  end

  describe "when quantity is blank" do
    before { @product_quantity_adjustment.quantity = nil }
    it { should_not be_valid }
  end
end
