Given /^I have a product with a quantity of (\d+)$/ do |quantity|
  @product = FactoryGirl.create(:product)
  @product.update_quantity(quantity)
end

When /^I change the quantity to (\d+)$/ do |quantity|
  visit products_path
  click_link "quantity_label_#{@product.id}"
  fill_in "quantity_input_#{@product.id}", :with => quantity
  find("body").click
end

Then /^that product should have a quantity of (\d+)$/ do |quantity|
  visit products_path
  page.should have_content(quantity)
end

Then /^there should be a record that the quantity was changed by (\d+)$/ do |amount|
  ProductQuantityAdjustment.last.quantity.abs.should == amount.to_i
end
