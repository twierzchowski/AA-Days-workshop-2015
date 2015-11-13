Feature: Closed shopping list can be reopened at once
  In order to reopen closed shopping list
  As a Matylda
  I want to reopen all subsequent products in closed shopping list

  @skip
  Scenario: List can be reopened with all tasks at once
    Given there is one shopping list named "Closed list" with 3 bought random products
    When "Closed list" will be reopened
    Then all products on "Closed list" should be not signed as bought
    And "Closed list" should be available
    And "Closed list" should be in repository
