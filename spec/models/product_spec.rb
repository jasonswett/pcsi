require 'spec_helper'

describe Product do
  before(:each) do
    @product = FactoryGirl.create(:product)
  end

  subject { @product }

  it { should be_valid }
end
