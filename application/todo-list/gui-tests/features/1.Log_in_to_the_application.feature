Feature: User can log in to the account
  As a shopaholic Matylda
  I want to log in to the application
  In order to see my shopping lists

  @test_gui_1
  Scenario: Log in to the application
    Given I am on "login" page
    When I enter correct login "matylda" with password "tezt"
    Then I should see "Lists for matyld"