# Zadanie GUI_3:
#
# Należy uzupełnić kroki z listy która juz istnieje.
# Aby odnaleźć zaimplementowane kroki, należy zainteresować się ściągawką lub użyć skrótu klawiszowego ... ;)
# lub otworzyć ploki:
#   - 'gui-tests/features/step_definitions/*.rb'
#
# Przy zrozumieniu logiki pomogą… Ci pliki:
#   - 'app/models/list.rb'
#   - 'app/models/task.rb'
#
# Proszę spojrzeć jeszcze do plików:
#   - 'gui-tests/features/pages/TaskListPage.rb'
#   - 'gui-tests/features/step_definitions/interaction.rb'
#
# Tam znajdziesz resztę zadania.
#
# Baw się dobrze!
# W razie problemów - nie krępuj się, zapytaj. :)

Feature: Shopping list stays open when not all product bought
  As a Matylda
  I want to see not bought products from my list
  In order to finish shopping and get all necessary products

  @test_gui_3
  Scenario: Buy available product from shopping list
    Given I am logged in as "matylda" with password "test"
    And I am on lists page
    And I add "ASAP shopping" list
    And I opened "ASAP shopping"
    And ...
    And ...
    When ...
    And I can`t buy eggs as they`ve already sold, so I can just drink beer for the morning breakfast
    And I go to lists page
    Then I should (not see?) see "Lists for matylda"
    And ...
    When ...
    Then I should see ...