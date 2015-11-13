Feature: Closed shopping list can be reopened at once
  In order to reopen closed shopping list
  As a Matylda
  I want to reopen all subsequent products in closed shopping list

  #
  # Zadanie BDD_5:
  #
  # W tym przypadku również, chcemy zaimplementować poszczególne kroki dotyczące pokrycia zmiany wymagań.
  # Od teraz listy można ponownie otworzyć, aby np. skorzystać z jednej z nich ponownie.
  # Następny plik, gdzie należy wprowadzić zmiany to:
  #   - 'step_definitions/additional_features.rb'
  #
  # Baw się dobrze!
  # W razie problemów - nie krępuj się, zapytaj. :)
  #

  @bdd5
   Scenario: List can be reopened with all products at once
    Given there is one shopping list named "Closed list" with 3 bought random products
    ??? 
