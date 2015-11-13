  # Zadanie GUI_2:
  # Należy tu uzupełnić kroki, z listy która juz istnieje.
  # Najpierw oczywiście przeczytaj User Story aby dowiedzieć się jaki problem rozwiązujesz.
  # Aby odnaleźć zaimplementowane kroki, należy zainteresować się ściągawką lub wywołać odpowiedni skrót klawiszowy
  # Baw się dobrze!
  # W razie problemów - nie krępuj się, zapytaj. :)

Feature: Closed lists are not visible to the user
  As a Matylda
  I want to finish shopping from my list
  In order to see only my active lists

  @test_gui_2
  Scenario: Closing list
    Given I am logged in as "matylda" with password "test"
    And I am on lists page
    And I add ...
    And ...
    And ...
    When I buy ..
    And I go to ...
    Then I should see "Lists for matylda"
    And ...