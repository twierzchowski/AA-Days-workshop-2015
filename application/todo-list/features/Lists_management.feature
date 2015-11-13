Feature: Shopping list management
  In order to remind about products to buy
  As a Matylda
  I want to create my shopping lists

  Scenario: Create new shopping list
    Given there are no shopping lists
    When "Party shopping list" will be created
    Then "Party shopping list" should be available
    And "Party shopping list" should has today's date

  Scenario: Viewing lists
    Given there are lists titled "First", "Second"
    Then "First" should be available
    And "Second" should be available

  Scenario: New list is by default empty
    Given there are no shopping lists
    When "My empty list" will be created
    Then "My empty list" has no products inside

  Scenario: Products can be placed to the list
    Given there is one empty list with name "New list"
    When "New list" will be opened
    And new product with name "bread" is added to the "New list"
    Then "New list" has 1 product inside
    And "bread" item should be opened

  Scenario: List can have many products
    Given there is one shopping list named "My non-empty list" with 3 random products
    When "My non-empty list" will be opened
    Then "My non-empty list" has 3 products inside

  Scenario: List with not all closed products is visible
    Given there is one shopping list named "Open list" with 2 random products
    When "Open list" will be opened
    And first visible product in list "Open list" will be signed as bought
    Then "Open list" should be available

  Scenario: List with all closed products is invisible
    Given there is one shopping list named "Closed list" with 1 random products
    When "Closed list" will be opened
    And first visible product in list "Closed list" will be signed as bought
    Then "Closed list" should not be available