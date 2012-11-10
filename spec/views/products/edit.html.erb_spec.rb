require 'spec_helper'

describe "products/edit" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :code => "MyString",
      :name => "MyString",
      :description => "MyText",
      :unit_of_measure_id => 1,
      :price_per_unit => "9.99"
    ))
  end

  it "renders the edit product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => products_path(@product), :method => "post" do
      assert_select "input#product_code", :name => "product[code]"
      assert_select "input#product_name", :name => "product[name]"
      assert_select "textarea#product_description", :name => "product[description]"
      assert_select "input#product_unit_of_measure_id", :name => "product[unit_of_measure_id]"
      assert_select "input#product_price_per_unit", :name => "product[price_per_unit]"
    end
  end
end
