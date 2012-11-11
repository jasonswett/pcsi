Feature: See Product Stock Level
  In order to keep accurate inventory
  Pharmacy employees
  Should be able to see how much of any certain product is in stock

  Scenario: I can see how much of a product is in stock
    Given I am a pharmacy employee
    And I have a product with a quantity of 100
    When I visit the product page
    Then I should see that that product has a quantity of 100
