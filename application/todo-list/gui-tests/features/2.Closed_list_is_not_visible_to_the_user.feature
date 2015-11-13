Feature: Closed lists are not visible to the user
  As a Matylda
  I want to display my shopping lists
  In order to see only my active lists

  @test_gui_2
  Scenario: Closing list
    Given I am logged in as "matylda" with password "test"
    And I am on lists page
    And I add "Breakfast shopping list" list
    And I opened "Breakfast shopping list"
    And I add 10 "eggs" product
    When I buy "eggs" and mark this on my list
    And I go to lists page
    And I should see "Lists for matylda"
    Then I should not see "Breakfast shopping list"