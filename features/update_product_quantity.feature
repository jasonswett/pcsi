Feature: Add Product
  In order to keep accurate inventory
  Pharmacy employees
  Should be able to update product quantities

  Scenario: I can update a product quantity
    Given I am a pharmacy employee
    And I have a product with a quantity of 100
    When I change the quantity to 82
    Then that product should have a quantity of 82
    And there should be a record that the quantity was changed by 18
