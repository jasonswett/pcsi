Given /^I am a pharmacist$/ do
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
