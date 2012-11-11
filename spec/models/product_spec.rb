require 'spec_helper'

describe Product do
  before(:each) do
    @product = FactoryGirl.create(:product)
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
end
