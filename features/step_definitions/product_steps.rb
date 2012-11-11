Given /^I am a pharmacist$/ do
end

Given /^I am a pharmacy employee$/ do
end

When /^I add a product$/ do
  @product_name = "Some Product"
  visit new_product_path
  fill_in "Code", :with => "123"
  fill_in "Name", :with => @product_name
  fill_in "Price per unit", :with => "50"
  click_on "Create Product"
end

Then /^that product should show up in the list of products$/ do
  visit products_path
  page.should have_content(@product_name)
end

When /^I visit the product page$/ do
  visit products_path
end

Then /^I should see that that product has a quantity of (\d+)$/ do |quantity|
  page.should have_content(quantity)
end
