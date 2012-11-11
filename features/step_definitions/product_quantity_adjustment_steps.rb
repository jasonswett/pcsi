Given /^I have a product with a quantity of (\d+)$/ do |quantity|
  product = FactoryGirl.create(:product)
  product.update_quantity(quantity)
end

When /^I change the quantity to (\d+)$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^that product should have a quantity of (\d+)$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^there should be a record that the quantity was changed by (\d+)$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end
