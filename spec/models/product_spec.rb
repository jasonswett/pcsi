require 'spec_helper'

describe Product do
  before(:each) do
    @product = FactoryGirl.build(:product)
  end

  subject { @product }

  it { should be_valid }

  describe "when name is blank" do
    before { @product.name = nil }
    it { should_not be_valid }
  end

  describe "when code is blank" do
    before { @product.code = nil }
    it { should_not be_valid }
  end

  describe "when price is blank" do
    before { @product.price_per_unit = nil }
    it { should_not be_valid }
  end

  describe "when code is not unique" do
    before do
      @other_product = FactoryGirl.create(:product, :code => "3249")
      @product.code = @other_product.code
    end
    it { should_not be_valid }
  end

  describe "#quantity" do
    it "returns 0 if new" do
      @product.quantity.should == 0
    end

    it "returns the right number after a few adjustments" do
      @product.update_quantity(100)
      @product.update_quantity(2)
      @product.update_quantity(46)
      @product.update_quantity(359)
      @product.update_quantity(17)
      @product.quantity.should == 17
    end
  end

  describe "#update_quantity" do
    it "updates the quantity" do
      @product.quantity.should == 0
      @product.update_quantity(20)
      @product.quantity.should == 20
    end
  end
end
