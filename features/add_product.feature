Feature: Add Product
  In order to serve customers
  Pharmacists
  Should be able to add a new product to the pharmacy

  Scenario: I can add a product
    Given I am a pharmacist
    When I add a product
    Then that product should show up in the list of products
