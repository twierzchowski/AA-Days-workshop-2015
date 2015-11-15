Feature: Viewing lists accessible to the user
  In order to view my list
  As a unknown user
  I want to log-in and view only my lists

  Scenario: Lists are connected to the user
    Given there is one authenticated user "Matylda" with password "123"
    And there is one user "Andrzej" with password "456"
    And there is one shopping list named "Matylda's list" with 1 product to buy by "Matylda"
    And "Matylda" should have "Matylda's list"
    When "Matylda" log out
    And authenticate "Andrzej" with password "456"
    Then "Andrzej" should have no lists