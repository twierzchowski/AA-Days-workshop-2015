Feature: Product Management
  In order to manage products and assignments
  As a Matylda
  I want to add products to my shopping lists

  Scenario: Add new product to shopping list
    Given there is one empty list with name "Party shopping list"
    When new product with name "beer" is added to the "Party shopping list"
    And "Party shopping list" will be opened
    Then 1 product in "Party shopping list" is available
    And "beer" item should be opened

  Scenario: Product should has a date
    Given there is one shopping list named "Non-empty list" with one item named "Item on the list"
    When "Non-empty list" will be opened
    Then "Item on the list" item should have today's date

  Scenario: Product should have a default state "Open"
    Given there is one shopping list named "Non-empty list" with one item named "Opened by default"
    When "Non-empty list" will be opened
    Then "Opened by default" item should be opened

  Scenario: Product state can be modified
    Given there is one shopping list named "Non-empty list" with one item named "Task for modification"
    When "Non-empty list" will be opened
    And "Task for modification" item will be closed
    Then "Task for modification" item should be closed

  Scenario: Product state can be toggled
    Given there is one shopping list named "Non-empty list" with one item named "Task for toggling"
    When "Non-empty list" will be opened
    And "Task for toggling" item will be closed
    And "Task for toggling" item will be opened
    Then "Task for toggling" item should be closed