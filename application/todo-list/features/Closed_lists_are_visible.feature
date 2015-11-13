Feature: Closed shopping lists are visible
  In order to see closed shopping lists
  As a Matylda
  I want to view lists which are closed

  @skip
  Scenario: Shopping list with all bought products is visible
    Given there is one shopping list named "Closed list" with 1 bought random products
    When "Closed list" will be opened
    Then "Closed list" should not be available
    And "Closed list" should be in repository