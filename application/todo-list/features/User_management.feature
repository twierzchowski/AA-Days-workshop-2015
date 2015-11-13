Feature: User Management
  In order to work with the application and manage user account
  As a unknown user
  I want to sign in and log in to the application

  @bdd1
  Scenario: Create new user
    Given there are no user
    When "Matilda" account is created with random password
    Then "Matylda" account should be available
    And "Matylda" should have non empty pasword

  Scenario: Sucessful authentication
    Given there is one user "Matylda" with password "123"
    Then "Matylda" should be authenticated with password "123"

  Scenario: Unsucessful authentication
    Given there is one user "Matylda" with password "123"
    Then "Matylda" should not be authenticated with password "Invalid Password"
